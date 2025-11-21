.PHONY: help setup dev clean

help: ## Show this help
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

setup: ## Initial setup (install deps, start DB)
	@echo "🚀 Setting up monorepo..."
	@echo "📦 Installing dependencies..."
	pnpm install
	@echo "✅ Setup complete! Run 'make dev' to start development."

dev: ## Start UI development server
	@echo "🔥 Starting UI development server..."
	pnpm dev:ui

dev-ui: ## Start only React frontend
	pnpm --filter ui dev

dev-db: ## Start only PostgreSQL
	docker-compose up postgres

db-start: ## Start PostgreSQL in background
	docker-compose up -d postgres

db-stop: ## Stop PostgreSQL
	docker-compose down

db-logs: ## Show PostgreSQL logs
	docker-compose logs -f postgres

build: ## Build all packages and apps
	pnpm run build

lint: ## Lint all code
	pnpm run lint

format: ## Format all code
	pnpm run format

typecheck: ## Type check TypeScript
	pnpm run typecheck

clean: ## Clean all build artifacts and dependencies
	@echo "🧹 Cleaning..."
	pnpm run clean
	docker-compose down -v
	@echo "✨ Clean complete!"

install: ## Install dependencies
	pnpm install
