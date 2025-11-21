# Agents API

Python FastAPI backend with AGNO agents.

## Setup

```bash
cd apps/agents

# Install dependencies (using Poetry)
poetry install

# Or using pip
pip install -r requirements.txt
```

## Development

```bash
# From monorepo root
pnpm dev:agents

# Or directly
poetry run uvicorn src.api.main:app --reload --port 8000
```

## Tech Stack

- Python 3.11+
- FastAPI
- AGNO (agentic framework)
- SQLAlchemy
- PostgreSQL
