# Enterprise Template - Project Context & Quick Start

**Last Updated:** 2025-11-21
**Status:** Monorepo setup complete, ready for backend development

---

## 🎯 Project Goal

Transform a React frontend template (shadcn-admin) into a **full-stack monorepo template** with:
- ✅ React/TypeScript UI (shadcn-admin)
- 🔜 Python AGNO agents (agentic AI framework)
- 🔜 FastAPI backend
- 🔜 PostgreSQL database
- 🔜 CopilotKit integration (AI copilot UI components)

This will be a **reusable template** for building full-stack apps with AI agents.

---

## 📂 Current Structure

```
enterprise-template/
├── apps/
│   ├── ui/              # ✅ React app (shadcn-admin) - WORKING
│   │   ├── src/         # All UI code
│   │   ├── package.json
│   │   └── vite.config.ts
│   │
│   └── agents/          # 🔜 Python API (structure ready)
│       ├── src/
│       │   ├── agents/  # AGNO agents will go here
│       │   ├── api/     # FastAPI app
│       │   └── database/# SQLAlchemy models
│       └── pyproject.toml
│
├── packages/
│   └── types/           # ✅ Shared TypeScript types
│       ├── src/
│       │   ├── user.ts  # User type definitions
│       │   └── task.ts  # Task type definitions
│       └── package.json
│
├── database/
│   ├── migrations/      # SQL migrations (empty)
│   └── seeds/           # Seed data (empty)
│
├── pnpm-workspace.yaml  # Monorepo config
├── docker-compose.yml   # PostgreSQL + PgAdmin
├── Makefile            # Development commands
└── package.json        # Root orchestration
```

---

## 🚀 Quick Start

### Install & Run UI

```bash
# From project root

# 1. Install all dependencies
make setup
# OR: pnpm install

# 2. Start UI dev server
make dev
# OR: pnpm dev:ui

# UI will be at: http://localhost:5173
```

### All Available Commands

```bash
make help          # Show all commands

# Development
make dev           # Start UI dev server
make dev-ui        # Start React frontend
make dev-db        # Start PostgreSQL

# Database
make db-start      # Start PostgreSQL in background
make db-stop       # Stop PostgreSQL
make db-logs       # View PostgreSQL logs

# Build & Quality
make build         # Build all packages
make lint          # Lint code
make format        # Format code
make typecheck     # TypeScript type checking

# Utilities
make clean         # Clean everything
make install       # Install dependencies
```

---

## 📚 Key Documentation Files

| File | Purpose |
|------|---------|
| `README.md` | Main project documentation |
| `STATUS.md` | Detailed progress tracking & next steps |
| `MIGRATION_SUMMARY.md` | How we migrated to monorepo |
| `CLEANUP_SUMMARY.md` | Root directory cleanup details |
| `PROJECT_CONTEXT.md` | **This file** - Quick context for new contributors |
| `apps/ui/README.md` | UI app documentation |
| `apps/agents/README.md` | Python API documentation |

---

## 🎨 Tech Stack

### Frontend (Current - Working)
- **React 19** + TypeScript
- **Vite** - Build tool & dev server
- **TanStack Router** - File-based routing
- **TanStack Query** - Data fetching (configured but not used yet)
- **shadcn/ui** - UI components (Radix + Tailwind)
- **Tailwind CSS v4** - Styling
- **Zustand** - State management

### Backend (Planned - Not Started)
- **Python 3.11+**
- **FastAPI** - API framework
- **AGNO v1.1.6** - Agentic framework (529x faster than LangGraph)
- **SQLAlchemy** - ORM
- **PostgreSQL 16** - Database

### Infrastructure (Ready)
- **PNPM Workspaces** - Monorepo management
- **Docker Compose** - PostgreSQL + PgAdmin
- **Makefile** - Cross-platform commands

### Future Integrations (Researched)
- **CopilotKit** - AI copilot UI components for React
- **AG-UI Protocol** - Communication between frontend and AGNO agents

---

## 🔍 What's Been Done

### Phase 1: Monorepo Setup ✅
- [x] Created monorepo with PNPM workspaces
- [x] Migrated shadcn-admin UI to `apps/ui/`
- [x] Created `apps/agents/` Python structure
- [x] Set up `packages/types/` for shared types
- [x] Configured Docker Compose for PostgreSQL
- [x] Created Makefile with dev commands
- [x] Cleaned up root directory (removed 15+ old files)
- [x] Updated documentation

### Current State
- ✅ **UI fully functional** (tested and working)
- ✅ **Monorepo structure complete**
- ✅ **Development workflow established**
- ✅ **43% reduction in root directory clutter**
- ✅ **All infrastructure ready**

**Progress: ~35% complete**

---

## 🎯 Next Steps (In Priority Order)

### Phase 3: Database Setup (Next!)
1. [ ] Start PostgreSQL: `make db-start`
2. [ ] Create database schema (see schema design below)
3. [ ] Write migration files in `database/migrations/`
4. [ ] Create seed data scripts
5. [ ] Test database connectivity

### Phase 4: Python AGNO Backend
1. [ ] Install Python dependencies: `cd apps/agents && poetry install`
2. [ ] Set up FastAPI application structure
3. [ ] Configure AGNO with PostgreSQL storage
4. [ ] Create basic CRUD endpoints (users, tasks, messages)
5. [ ] Create example AGNO agent (Task Assistant)
6. [ ] Implement AG-UI protocol for streaming
7. [ ] Test agent execution

### Phase 5: Frontend-Backend Integration
1. [ ] Update UI to call real API endpoints
2. [ ] Replace Faker.js mock data with API calls
3. [ ] Use TanStack Query for data fetching
4. [ ] Test CRUD operations from UI

### Phase 6: CopilotKit Integration
1. [ ] Install CopilotKit packages in UI
2. [ ] Add CopilotKit provider to React app
3. [ ] Create custom agent chat components
4. [ ] Style with shadcn/ui theme
5. [ ] Implement human-in-the-loop actions
6. [ ] Test AG-UI streaming between frontend and agents

---

## 🗄️ Database Schema (Designed, Not Implemented)

### Core Tables
```sql
-- Users table
CREATE TABLE users (
    id UUID PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    username VARCHAR(50) UNIQUE,
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(20),
    status VARCHAR(20), -- 'active' | 'inactive' | 'invited' | 'suspended'
    role VARCHAR(20),   -- 'superadmin' | 'admin' | 'cashier' | 'manager'
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Tasks table
CREATE TABLE tasks (
    id VARCHAR(50) PRIMARY KEY, -- e.g., "TASK-1234"
    title VARCHAR(255),
    description TEXT,
    status VARCHAR(20),     -- 'todo' | 'in progress' | 'done' | 'canceled' | 'backlog'
    label VARCHAR(20),      -- 'bug' | 'feature' | 'documentation'
    priority VARCHAR(10),   -- 'low' | 'medium' | 'high'
    assignee_id UUID REFERENCES users(id),
    due_date TIMESTAMP,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Messages/Conversations
CREATE TABLE conversations (
    id UUID PRIMARY KEY,
    user_id UUID REFERENCES users(id),
    title VARCHAR(255),
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE messages (
    id UUID PRIMARY KEY,
    conversation_id UUID REFERENCES conversations(id),
    sender_id UUID REFERENCES users(id),
    sender_type VARCHAR(20), -- 'user' | 'agent' | 'system'
    content TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);
```

### AGNO-Specific Tables
```sql
-- AGNO agent sessions
CREATE TABLE agent_sessions (
    id UUID PRIMARY KEY,
    session_id VARCHAR(255) UNIQUE,
    agent_name VARCHAR(100),
    user_id UUID REFERENCES users(id),
    session_data JSONB,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- AGNO agent memory
CREATE TABLE agent_memory (
    id UUID PRIMARY KEY,
    user_id UUID REFERENCES users(id),
    agent_name VARCHAR(100),
    memory_type VARCHAR(50), -- 'session' | 'user' | 'culture'
    content JSONB,
    created_at TIMESTAMP DEFAULT NOW()
);

-- AGNO agent runs (audit log)
CREATE TABLE agent_runs (
    id UUID PRIMARY KEY,
    session_id UUID REFERENCES agent_sessions(id),
    agent_name VARCHAR(100),
    input JSONB,
    output JSONB,
    status VARCHAR(20),     -- 'running' | 'completed' | 'failed'
    duration_ms INTEGER,
    created_at TIMESTAMP DEFAULT NOW()
);
```

**Full schema available in earlier conversation for reference.**

---

## 🔧 Key Technologies Explained

### AGNO Framework
- **What:** Multi-agent Python framework for building AI agents
- **Why:** 529x faster than LangGraph, native PostgreSQL support
- **Key Features:**
  - Session memory, user memory, culture memory
  - RAG support (20+ vector databases)
  - MCP (Model Context Protocol) support
  - 100+ built-in toolkits
  - Human-in-the-loop workflows
  - Multi-agent teams
- **Docs:** https://github.com/agno-agi/agno
- **Install:** `pip install "agno[postgres]"`

### CopilotKit
- **What:** React framework for adding AI copilots to your app
- **Why:** Pre-built UI components, works with any agent framework
- **Key Features:**
  - Pre-built chat UI components
  - Headless UI option for customization
  - State sharing between UI and agents
  - Human-in-the-loop actions
  - Works with shadcn/ui (requires minor CSS tweaks)
- **Docs:** https://www.copilotkit.ai/
- **Official AGNO Integration:** Yes, via AG-UI protocol

### AG-UI Protocol
- **What:** Event-based protocol for frontend-agent communication
- **Why:** Standardized way to stream agent responses to UI
- **How:** Server-Sent Events (SSE) for real-time streaming
- **Events:** TEXT_MESSAGE, TOOL_CALL, STATE_SNAPSHOT, etc.

### PNPM Workspaces
- **What:** Monorepo management for TypeScript/JavaScript
- **Why:** Efficient, fast, simple (vs Nx or Turborepo)
- **Config:** `pnpm-workspace.yaml`
- **Commands:** `pnpm --filter <app> <command>`

---

## 🏗️ Architecture Overview

```
┌─────────────────────────────────────────────────┐
│          React UI (shadcn-admin)                │
│     http://localhost:5173                       │
│                                                 │
│  - shadcn/ui components                         │
│  - TanStack Router (file-based)                 │
│  - TanStack Query (data fetching)               │
│  - CopilotKit (AI copilot UI)                   │
└─────────────────────────────────────────────────┘
                    ↓ HTTP + SSE
┌─────────────────────────────────────────────────┐
│          FastAPI Backend                        │
│     http://localhost:8000                       │
│                                                 │
│  - REST API endpoints (CRUD)                    │
│  - AG-UI protocol endpoints (streaming)         │
│  - SQLAlchemy ORM                               │
└─────────────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────────────┐
│          AGNO Agents                            │
│                                                 │
│  - Task Assistant Agent                         │
│  - Analytics Agent                              │
│  - Multi-agent teams                            │
│  - PostgreSQL storage (sessions, memory)        │
└─────────────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────────────┐
│          PostgreSQL Database                    │
│     localhost:5432                              │
│                                                 │
│  - App data (users, tasks, messages)            │
│  - Agent data (sessions, memory, runs)          │
└─────────────────────────────────────────────────┘
```

---

## 📝 Environment Setup

### Root `.env` (create from `.env.example.root`)
```bash
# Database
POSTGRES_DB=enterprise_app
POSTGRES_USER=dev
POSTGRES_PASSWORD=devpass
POSTGRES_HOST=localhost
POSTGRES_PORT=5432
DATABASE_URL=postgresql://dev:devpass@localhost:5432/enterprise_app

# PgAdmin
PGADMIN_EMAIL=admin@example.com
PGADMIN_PASSWORD=admin
PGADMIN_PORT=5050

# API
API_PORT=8000
VITE_API_URL=http://localhost:8000/api

# LLM Keys
ANTHROPIC_API_KEY=your_key_here
OPENAI_API_KEY=your_key_here
```

### UI `.env` (apps/ui/.env)
```bash
VITE_API_URL=http://localhost:8000/api
```

### Agents `.env` (apps/agents/.env)
```bash
DATABASE_URL=postgresql://dev:devpass@localhost:5432/enterprise_app
API_HOST=0.0.0.0
API_PORT=8000
ANTHROPIC_API_KEY=your_key_here
```

---

## 🔍 Important Notes

### Current UI State
- ✅ Fully functional with **mock data** (Faker.js)
- ✅ All routes working
- ✅ No API integration yet (all data is static)
- ✅ TanStack Query configured but not used

### What's NOT Done Yet
- ❌ No database (PostgreSQL ready but not started)
- ❌ No Python backend (structure exists, no code)
- ❌ No AGNO agents (will be created)
- ❌ No API endpoints (FastAPI not implemented)
- ❌ No CopilotKit integration (researched, not installed)
- ❌ No real-time features

### Known Issues
- None! Everything working as expected.

### Git Branch
- Current branch: `forge/092f-check-what-this`
- Successfully rebased onto `main`
- Ready to continue development

---

## 🤝 Team Guidelines

When continuing this project:

1. **Start PostgreSQL first**: `make db-start`
2. **Work incrementally**: Complete one phase at a time
3. **Test frequently**: Verify each component works
4. **Document as you go**: Update relevant README files
5. **Use the Makefile**: Consistent commands across team
6. **Follow the next steps**: See "Next Steps" section above

### Recommended Development Order
1. ✅ Monorepo setup (DONE)
2. 🔜 Database setup (START HERE)
3. 🔜 Basic FastAPI backend
4. 🔜 One simple AGNO agent
5. 🔜 UI integration with API
6. 🔜 CopilotKit integration

---

## 🆘 Troubleshooting

### UI won't start
```bash
# Clean and reinstall
make clean
make setup
make dev
```

### Port already in use
- UI uses ports 5173-5175 (tries multiple)
- Check with: `lsof -i :5173`

### PNPM issues
```bash
# Update pnpm
npm install -g pnpm@latest

# Clear cache
pnpm store prune
```

### Database connection issues
```bash
# Check if PostgreSQL is running
make db-logs

# Restart PostgreSQL
make db-stop
make db-start
```

---

## 📚 Additional Resources

### Documentation
- AGNO: https://github.com/agno-agi/agno
- CopilotKit: https://www.copilotkit.ai/
- shadcn/ui: https://ui.shadcn.com/
- TanStack Router: https://tanstack.com/router
- TanStack Query: https://tanstack.com/query
- FastAPI: https://fastapi.tiangolo.com/

### Key Files to Read
1. `STATUS.md` - Detailed progress and next steps
2. `MIGRATION_SUMMARY.md` - How the monorepo was created
3. `apps/ui/README.md` - UI app details
4. `packages/types/src/` - Shared type definitions

---

## ✅ Quick Health Check

Run these to verify everything is working:

```bash
# 1. Install dependencies
make setup

# 2. Start UI
make dev

# 3. Check if UI loads at http://localhost:5173
# Should see shadcn-admin dashboard

# 4. Check monorepo structure
ls -la apps/
ls -la packages/

# 5. Verify PostgreSQL setup (don't start yet, just check)
docker-compose config
```

---

## 🎯 Success Criteria

The project will be "complete" when:
- ✅ UI works with real backend API (not mocks)
- ✅ PostgreSQL database running with proper schema
- ✅ At least one AGNO agent working (Task Assistant)
- ✅ CopilotKit integrated with custom UI
- ✅ Users can chat with agents from the UI
- ✅ Agents can perform actions (create tasks, analyze data)
- ✅ Real-time streaming of agent responses
- ✅ Template can be cloned and used for new projects

---

**Current Status: Ready for Phase 3 (Database Setup)**

**Next Action: Start PostgreSQL and create database schema**

```bash
make db-start
# Then create migrations in database/migrations/
```

---

*For detailed conversation history, see earlier messages in this session.*
