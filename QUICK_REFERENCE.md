# Quick Reference Card

## 🚀 Start Here (5 Minutes)

```bash
# 1. Install everything
make setup

# 2. Start UI
make dev

# 3. Visit: http://localhost:5173
```

---

## 📂 What's Where

```
apps/ui/         → React frontend (working)
apps/agents/     → Python API (empty structure)
packages/types/  → Shared TypeScript types
database/        → Migrations & seeds (empty)
```

---

## 🛠️ Common Commands

```bash
make dev          # Start UI
make db-start     # Start PostgreSQL
make build        # Build everything
make clean        # Clean everything
make help         # Show all commands
```

---

## 📄 Key Files

- `PROJECT_CONTEXT.md` ← **Start here for full context**
- `STATUS.md` ← Detailed progress & next steps
- `README.md` ← Project overview
- `Makefile` ← All commands

---

## 🎯 Current Status

✅ **Done:** Monorepo setup, UI working
🔜 **Next:** Database setup → Python backend → AGNO agents → CopilotKit

**Progress:** ~35% complete

---

## 🔍 Tech Stack

**Frontend:** React 19 + TypeScript + Vite + shadcn/ui
**Backend:** Python + FastAPI + AGNO (not started)
**Database:** PostgreSQL (ready, not started)
**Monorepo:** PNPM Workspaces

---

## 🆘 Quick Fixes

**UI won't start?**
```bash
make clean && make setup && make dev
```

**Need full context?**
```bash
cat PROJECT_CONTEXT.md
```

**Check what's installed?**
```bash
pnpm list --depth=0
```

---

## 📚 External Docs

- AGNO: https://github.com/agno-agi/agno
- CopilotKit: https://www.copilotkit.ai/
- shadcn/ui: https://ui.shadcn.com/

---

**Questions? Read `PROJECT_CONTEXT.md` for full details.**
