#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import re
import sys
import socket
import argparse
import ssl
from pathlib import Path
from typing import List, Tuple, Optional
from urllib.request import Request, urlopen
from urllib.error import URLError, HTTPError
from http.client import InvalidURL
from concurrent.futures import ThreadPoolExecutor, as_completed
from datetime import datetime

LINK_RE = re.compile(r'\[([^\]]*)\]\(([^)]*)\)')
CODE_FENCE_RE = re.compile(r'^`{3,}')
INLINE_CODE_RE = re.compile(r'`[^`]*`')
ANCHOR_OR_QUERY_RE = re.compile(r'[#?].*$')


def find_markdown_files(content_dir: Path) -> List[Path]:
    return sorted(p for p in content_dir.rglob('*.md') if p.is_file())


def extract_links(file_path: Path) -> List[Tuple[str, str, int]]:
    links = []
    in_code_block = False

    with open(file_path, 'r', encoding='utf-8') as f:
        for line_num, line in enumerate(f, 1):
            stripped = line.strip()

            if CODE_FENCE_RE.match(stripped):
                in_code_block = not in_code_block
                continue
            if in_code_block:
                continue

            cleaned = INLINE_CODE_RE.sub('', line)

            for match in LINK_RE.finditer(cleaned):
                link_text = match.group(1)
                url = match.group(2).strip()
                if url:
                    links.append((link_text, url, line_num))

    return links


def classify(url: str) -> str:
    if url.startswith(('http://', 'https://')):
        return 'internet'
    if url.startswith('/'):
        return 'absolute'
    return 'relative'


def strip_anchor_and_query(url: str) -> str:
    return ANCHOR_OR_QUERY_RE.sub('', url)


def resolve_content_path(url: str, source_file: Path, content_dir: Path) -> Optional[Path]:
    clean = strip_anchor_and_query(url)
    resolved_content_dir = content_dir.resolve()

    if url.startswith('/'):
        candidate = (resolved_content_dir / clean.lstrip('/')).resolve()
    else:
        candidate = (source_file.parent / clean).resolve()

    try:
        candidate.relative_to(resolved_content_dir)
    except ValueError:
        return None

    if candidate.exists():
        return candidate

    if not candidate.suffix:
        md_candidate = candidate.with_suffix('.md')
        if md_candidate.exists():
            return md_candidate

    if candidate.suffix == '.html':
        md_candidate = candidate.with_suffix('.md')
        if md_candidate.exists():
            return md_candidate

    if candidate.is_dir() or (not candidate.exists() and candidate.parent.is_dir()):
        index = candidate / 'index.md'
        if index.exists():
            return index

    return None


def validate_internet(url: str, timeout: int, skip_internet: bool) -> Tuple[bool, str]:
    if skip_internet:
        return True, ""

    ctx = ssl.create_default_context()

    for method in ('HEAD', 'GET'):
        try:
            req = Request(url, method=method)
            req.add_header('User-Agent',
                           'Mozilla/5.0 (compatible; LinkChecker/1.0)')
            with urlopen(req, timeout=timeout, context=ctx) as resp:
                return True, ""
        except HTTPError as e:
            if e.code == 405:
                continue
            return False, f"HTTP {e.code}"
        except URLError as e:
            if method == 'HEAD':
                continue
            return False, str(e.reason)
        except (socket.timeout, ConnectionResetError, InvalidURL):
            if method == 'HEAD':
                continue
            return False, "Timeout"

    return False, "Unreachable"


def validate_file_link(url: str, source_file: Path, content_dir: Path) -> Tuple[bool, str]:
    if url.startswith('/tags'):
        return True, ""
    resolved = resolve_content_path(url, source_file, content_dir)
    if resolved is None:
        return False, "File not found"
    return True, ""


def process_file(file_path: Path, content_dir: Path, timeout: int,
                 skip_internet: bool) -> Tuple[str, List[Tuple[str, str, int, str]]]:
    file_rel = str(file_path.relative_to(content_dir))

    links = extract_links(file_path)

    internet_links = []
    file_links = []

    for text, url, line in links:
        kind = classify(url)
        if kind == 'internet':
            internet_links.append((text, url, line))
        else:
            file_links.append((text, url, line))

    broken = []

    for text, url, line in file_links:
        valid, reason = validate_file_link(url, file_path, content_dir)
        if not valid:
            broken.append((text, url, line, reason))

    if internet_links:
        with ThreadPoolExecutor(max_workers=10) as executor:
            futures = {
                executor.submit(validate_internet, url, timeout, skip_internet): (text, url, line)
                for text, url, line in internet_links
            }
            for future in as_completed(futures):
                text, url, line = futures[future]
                valid, reason = future.result()
                if not valid:
                    broken.append((text, url, line, reason))

    broken.sort(key=lambda x: x[2])
    return file_rel, broken


def report_broken(all_broken: List[Tuple[str, List[Tuple[str, str, int, str]]]],
                  output_path: Path) -> bool:
    timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

    lines = [f"# Broken Links Report", f"Generated: {timestamp}", ""]

    has_any = False
    for file_rel, broken_links in all_broken:
        if not broken_links:
            continue
        has_any = True
        lines.append(f"## {file_rel}")
        for text, url, line, reason in broken_links:
            lines.append(f"- `{text}` <{url}> (line {line}) — {reason}")
        lines.append("")

    if not has_any:
        lines.append("No broken links found.")
        lines.append("")

    output_path.write_text('\n'.join(lines), encoding='utf-8')
    return has_any


def main():
    parser = argparse.ArgumentParser(description='Check links in Markdown files.')
    parser.add_argument('--content-dir', default='content',
                        help='Content directory path (default: content)')
    parser.add_argument('--output', default='broken_links.md',
                        help='Output report file (default: broken_links.md)')
    parser.add_argument('--timeout', type=int, default=10,
                        help='HTTP request timeout in seconds (default: 10)')
    parser.add_argument('--workers', type=int, default=10,
                        help='Parallel workers for internet checks (default: 10)')
    parser.add_argument('--skip-internet', action='store_true',
                        help='Skip internet link validation')
    args = parser.parse_args()

    content_dir = Path(args.content_dir).resolve()
    if not content_dir.is_dir():
        print(f"Error: Content directory '{content_dir}' not found.",
              file=sys.stderr)
        sys.exit(1)

    files = find_markdown_files(content_dir)
    all_broken = []
    total_internet = 0
    total_file = 0

    for file_path in files:
        print(f"Validating links in {file_path}...")
        
        file_rel, broken = process_file(file_path, content_dir,
                                        args.timeout, args.skip_internet)
        all_broken.append((file_rel, broken))

        for text, url, line, reason in broken:
            print(f"[BROKEN] {file_rel}:{line} - {text} <{url}> - {reason}")

        links = extract_links(file_path)
        for _, url, _ in links:
            if classify(url) == 'internet':
                total_internet += 1
            else:
                total_file += 1

    output_path = Path(args.output)
    if not output_path.is_absolute():
        output_path = Path.cwd() / args.output
    has_broken = report_broken(all_broken, output_path)

    print(f"\nChecked {len(files)} files "
          f"({total_internet} internet, {total_file} local links).")
    print(f"Report written to {output_path}")

    if has_broken:
        sys.exit(1)


if __name__ == '__main__':
    main()
