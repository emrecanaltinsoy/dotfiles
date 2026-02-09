---
description: check and update README files based on last 5 commits
code: agent: build
model: opencode/kimi-k2.5-free
---

# README Update Command

## Instructions

1. **Check if git is initialized** in the repository by checking for `.git` directory

2. **If git is not initialized**: Inform the user that git is required for this command and ask if they want to initialize it or continue without commit-based filtering

3. **Get the last 5 commits**: Run `git log -5 --name-only --pretty=format:"%H"` to get the commit hashes and changed files

4. **Identify changed files**: Extract the list of files that were modified in the last 5 commits

5. **Find affected directories**: From the changed files, identify which directories were affected

6. **Find relevant README files**: Search for README files (`**/README.md`, `**/README`, `**/readme.md`, `**/README.txt`, `**/README.rst`) only in directories that contain changed files or their parent directories

7. **If no relevant README files found**: Inform the user and ask if they want to search all README files instead

8. **If README files found**: Present the list to the user and ask if they want to update any of them

9. **Selection options** (when multiple READMEs exist):
   - Provide a multi-select list of relevant README files
   - Include a "Select All" option at the top
   - Allow custom input for the user to specify paths manually
   - Let user select multiple files at once

10. **For each selected README**:
    - Identify the directory where the README resides
    - Analyze ONLY the files that were changed in the last 5 commits within that directory and its subdirectories
    - Compare the current README content with the changed files
    - Identify sections that may need updates based on recent changes
    - Propose updates to the user before making changes

11. **Before updating each README**:
    - Show the user what changes will be made
    - Ask for confirmation before applying changes
    - Preserve existing formatting style and structure where possible
    - Keep any custom sections the user has added

## Important Rules

- DO NOT read the entire codebase - only analyze files changed in the last 5 commits
- DO NOT update any README without explicit user confirmation
- DO NOT remove existing content unless it's clearly outdated or incorrect
- PRESERVE the original tone and style of the README
- KEEP badges, images, and links intact unless they're broken
- ASK the user if you're unsure about any changes
