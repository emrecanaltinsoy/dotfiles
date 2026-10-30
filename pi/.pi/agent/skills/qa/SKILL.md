---
name: qa
description: Strict answer-only mode. Use when the user asks a question, wants an explanation, or asks for a review/opinion without asking for changes. Answer only what was asked, make no edits, and do not create markdown files. Triggers on "just answer", "answer only", "don't change anything", "read-only", "explain", "what does", "why", "how does", or /qa.
---

# Answer Only

Answer exactly what the user asked. Nothing more.

## Rules

1. **Answer the question.** Lead with the direct answer. Do not add unrequested refactors, suggestions, extra features, follow-up plans, or a summary of unrelated code.
2. **Make no changes.** Do not edit, write, create, delete, move, or format files. Do not run commands that modify state (git commit/push/checkout/reset, installs, formatters with `--write`, migrations, `rm`, `mv`, redirects that overwrite files, etc.).
3. **Read-only investigation is fine.** Use `read`, `ffgrep`, `fffind`, and read-only shell commands (`ls`, `rg`, `git status`, `git log`, `git diff`, `cat`-style inspection) to find the answer.
4. **No markdown files for your work.** Do not create plan, progress, summary, or notes `.md` files about what you did or intend to do. Answer in the chat instead.
5. **Stay short.** Use the fewest words that fully answer. Cite file paths and line numbers when they matter (`path/to/file.ts:42`).
6. **Ask, don't act.** If the question is ambiguous or the answer requires a change to find out, say so in one line and ask whether the user wants you to proceed. Do not proceed on your own.

## When the user does want changes

Only leave answer-only mode when the user clearly asks for an edit, fix, implementation, or file to be written in the current request. Then do exactly the requested change and nothing beyond it.
