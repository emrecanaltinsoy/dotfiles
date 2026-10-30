# Global Agent Instructions

## Python Development

- **Python Version:** Always prefer and target **Python 3.15** for new environments and project initializations.
- **Package Manager:** Always use `uv` for environment management and dependency installations. Never use `pip`, `venv`, or `poetry`.
- **Environment Creation:** Initialize environments using `uv venv --python 3.15`.
- **Dependency Management:** Use `uv add <package>` or `uv add --dev <package>`.
- **Formatting & Linting:** Always use `ruff` for code formatting and linting. Run it via `uv run ruff format` and `uv run ruff check --fix`.
- **Testing:** Always use `pytest` with `pytest-cov` for testing and coverage.
- **Test Command:** Execute tests using `uv run pytest --cov=. --cov-report=term-missing`.
- **Tool Execution:** Prefix all python tools, linters, or scripts with `uv run`.

## JavaScript / TypeScript Development

- **Package Manager:** Always use `npm` for managing dependencies and running scripts.
- **Formatting & Linting:** Always use `biome` for formatting and linting instead of Prettier or ESLint.
- **Biome Commands:** Run formatting and linting via `npx @biomejs/biome check --write .`.
