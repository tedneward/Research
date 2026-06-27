# Broken Links Report
Generated: 2026-06-26 20:02:51

## test_links.md
- `Valid with path` <https://www.example.com/test/page> (line 9) — HTTP 404
- `Broken domain` <https://this-domain-does-not-exist-12345.com> (line 10) — [Errno 8] nodename nor servname provided, or not known
- `Broken path` <https://www.example.com/nonexistent/page/that/does/not/exist> (line 11) — HTTP 404
- `Broken absolute link` </nonexistent-file> (line 19) — File not found
- `Broken absolute path` </subdir/nonexistent> (line 20) — File not found
- `Valid relative parent` <../scripts/test_content/exists> (line 26) — File not found
- `Broken relative` <./nonexistent> (line 28) — File not found
- `Broken relative subdir` <./subdir/no-such-file> (line 29) — File not found
