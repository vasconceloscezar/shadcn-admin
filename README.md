# Enterprise Template

A production-ready monorepo template with React UI, Python AGNO agents, and PostgreSQL.

> Based on [shadcn-admin](https://github.com/satnaing/shadcn-admin) by [@satnaing](https://github.com/satnaing)

## 🏗️ Structure

```
enterprise-template/
├── apps/
│   ├── ui/              # React + TypeScript frontend (Vite, shadcn/ui)
│   └── agents/          # Python FastAPI + AGNO agents (coming soon)
├── packages/
│   └── types/           # Shared TypeScript types
├── database/
│   ├── migrations/      # SQL migrations
│   └── seeds/           # Seed data
└── docker-compose.yml   # PostgreSQL + PgAdmin
```

## 🚀 Quick Start

```bash
# 1. Install dependencies
make setup

# 2. Start development
make dev

# The UI will be available at http://localhost:5173
```

## 📦 Tech Stack

### Frontend (apps/ui)
- **React 19** + TypeScript
- **Vite** - Build tool
- **TanStack Router** - File-based routing
- **TanStack Query** - Data fetching
- **shadcn/ui** - UI components
- **Tailwind CSS v4** - Styling

### Backend (apps/agents) - Coming Soon
- **Python 3.11+**
- **FastAPI** - API framework
- **AGNO** - Agentic framework
- **SQLAlchemy** - ORM
- **PostgreSQL** - Database

### Integrations - Coming Soon
- **CopilotKit** - AI copilot UI components
- **AG-UI Protocol** - Frontend-agent communication

## 🛠️ Development

### Available Commands

```bash
make help          # Show all commands
make setup         # Install dependencies
make dev           # Start UI dev server
make dev-ui        # Start only UI
make dev-db        # Start PostgreSQL
make build         # Build all packages
make lint          # Lint code
make format        # Format code
make clean         # Clean everything
```

### Working with the UI

```bash
cd apps/ui
pnpm dev           # Start dev server
pnpm build         # Build for production
pnpm lint          # Lint code
```

### Database

```bash
make db-start      # Start PostgreSQL
make db-stop       # Stop PostgreSQL
make db-logs       # View logs

# Access PgAdmin at http://localhost:5050
# Email: admin@example.com
# Password: admin
```

## 📝 Environment Variables

Copy `.env.example.root` to `.env` in the root directory:

```bash
cp .env.example.root .env
```

For apps:
```bash
cp apps/ui/.env.example apps/ui/.env
cp apps/agents/.env.example apps/agents/.env
```

## 🎨 Features

### Current Features
- ✅ Modern React UI with shadcn/ui components
- ✅ File-based routing with TanStack Router
- ✅ Data fetching with TanStack Query
- ✅ Light/Dark mode
- ✅ Responsive design
- ✅ TypeScript throughout
- ✅ Monorepo with PNPM workspaces

### Coming Soon
- 🔜 Python AGNO agents
- 🔜 FastAPI backend
- 🔜 PostgreSQL integration
- 🔜 CopilotKit AI copilot
- 🔜 Real-time agent streaming
- 🔜 Shared types between frontend/backend

## 📚 Documentation

- [UI App](./apps/ui/README.md)
- [Agents API](./apps/agents/README.md)
- [Types Package](./packages/types/README.md)
- [Original shadcn-admin README](./README.original.md)

## 🤝 Contributing

This is a template repository. Fork it and customize for your needs!

## 📄 License

MIT License

## 🙏 Credits

- UI template: [shadcn-admin](https://github.com/satnaing/shadcn-admin) by [@satnaing](https://github.com/satnaing)
- UI components: [shadcn/ui](https://ui.shadcn.com/)
- Agentic framework: [AGNO](https://github.com/agno-agi/agno)
- AI copilot: [CopilotKit](https://www.copilotkit.ai/)
