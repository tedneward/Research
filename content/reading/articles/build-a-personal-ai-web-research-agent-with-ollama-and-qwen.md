title=Article: Personal Web Research AI Agent with Ollama and Qwen
tags=reading, ai, agent, ollama, qwen
summary=
~~~~~~

Source: https://www.freecodecamp.org/news/build-a-personal-ai-web-research-agent-with-ollama-and-qwen/ (26 June 2026)

## Tidbits

- Ollama Web Search API - what's its limits?
- BeautifulSoup - Python library for parsing/extracting HTML?

## Article

User prompt -> Ollama Web Search API -> Top 5 result URLs -> requests + Beautiful Soup -> Clean page text -> Local Qwen model -> MD digest saved to disk

### Step 1: Install Ollama and get an API key

(For using the Ollama Web Search API on the server.)

### Step 2: Pull the Qwen model

`ollama pull qwen3.5:4b`

### Step 3: Install Python dependencies

```
python3 -m venv venv
source venv/bin/activate
pip install ollama requests beautifulsoup4
```

### Step 4: Agent code

research_agent.py
```
import os
import json
import requests
import ollama
from bs4 import BeautifulSoup
from datetime import datetime
from pathlib import Path

API_KEY = os.getenv("OLLAMA_API_KEY")
SEARCH_URL = "https://ollama.com/api/web_search"
MODEL = "qwen3.5:4b"

# Search web using Ollama web search 
def search_web(query):
    response = requests.post(
        SEARCH_URL,
        headers={"Authorization": f"Bearer {API_KEY}"},
        json={"query": query, "max_results": 5},
        timeout=30,
    )
    response.raise_for_status()
    return response.json().get("results", [])

# Fetch full web page content
def fetch_text(url):
    try:
        response = requests.get(url, timeout=10)
        response.raise_for_status()
    except requests.RequestException as e:
        return ""
    soup = BeautifulSoup(response.text, "html.parser")
    for tag in soup(["script", "style", "nav", "footer"]):
        tag.decompose()
    return soup.get_text(separator="\n", strip=True)


def main():
    user_prompt = input("Enter your prompt: ").strip()
    if not user_prompt:
        print("Prompt cannot be empty.")
        return

    results = search_web(user_prompt)

    # For each url in web search result, fetch full content
    pages = []
    for item in results:
        url = item.get("url")
        if not url:
            continue

        print(f"Fetching: {url}")
        page_text = fetch_text(url)

        pages.append({
            "title": item.get("title", ""),
            "url": url,
            "snippet": item.get("content", ""),
            "page_text": page_text,
        })

    # Prompt to send to Qwen model with web data
    prompt = f"""
    User request:
    {user_prompt}

    Use these web results and page contents to answer in markdown format.

    Data:
    {json.dumps(pages, ensure_ascii=False)}
    """

    # Invoke local Qwen model 
    response = ollama.chat(
        model=MODEL,
        messages=[{"role": "user", "content": prompt}],
    )

    digest = response.message.content

    # Build a unique filename using today's date and time
    timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
    filename = f"digest-{timestamp}.md"

    # Save the digest to disk
    with open(filename, "w") as f:
        f.write(digest)
    
    print(f"Saved to digest")

if __name__ == "__main__":
    main()
```

### Step 5: Running the agent

