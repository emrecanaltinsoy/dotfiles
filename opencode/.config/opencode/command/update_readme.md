---
description: check and update README files based on related code
agent: build
model: opencode/kimi-k2.5-free
---

# README Update Command

## Instructions

1. **Find all README files** in the repository using glob patterns (`**/README.md`, `**/README`, `**/readme.md`, `**/README.txt`, `**/README.rst`)

2. **If no README files found**: Inform the user and ask if they want to create one.

3. **If README files found**: Present the list to the user and ask if they want to update any of them.

4. **Selection options** (when multiple READMEs exist):
   - Provide a multi-select list of all found README files
   - Include a "Select All" option at the top
   - Allow custom input for the user to specify paths manually
   - Let user select multiple files at once

5. **For each selected README**:
   - Identify the directory where the README resides
   - Analyze the code in that directory and subdirectories to understand:
     - Project structure
     - Main functionality
     - Dependencies
     - Usage patterns
     - Configuration options
     - API endpoints (if applicable)
   - Compare the current README content with the actual codebase
   - Identify sections that are outdated, missing, or incorrect
   - Propose updates to the user before making changes

6. **Before updating each README**:
   - Show the user what changes will be made
   - Ask for confirmation before applying changes
   - Preserve existing formatting style and structure where possible
   - Keep any custom sections the user has added

## Important Rules

- DO NOT update any README without explicit user confirmation
- DO NOT remove existing content unless it's clearly outdated or incorrect
- PRESERVE the original tone and style of the README
- KEEP badges, images, and links intact unless they're broken
- ASK the user if you're unsure about any changes
