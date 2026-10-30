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

## Markdown Files & Documentation

- **Do not create markdown (`.md`) files for your own work.** No plan files, progress logs, summaries, notes, or task write-ups for what you did or intend to do. Keep plans and status in the chat reply or the todo tool.
- **If code changes, update the existing documentation that describes it.** When behavior, usage, config, commands, or APIs change, update the affected README/docs in the same change so they stay accurate.
- **Do not add new documentation files** unless the user explicitly asks for one.

## Safety & Working Style

- **Confirm before risky actions.** Ask first before `git push`, `git reset --hard`, force operations, `rm`/bulk deletes, package installs, or anything touching `~/.ssh`, `.env` files, or credentials.
- **No commits unless asked.** Do not run `git commit` unless the user explicitly requests it.
- **Secrets stay out of output.** Never write tokens, keys, or passwords into files, logs, or chat replies.
- **Concise replies.** Short answers; cite file paths with line numbers when relevant.
