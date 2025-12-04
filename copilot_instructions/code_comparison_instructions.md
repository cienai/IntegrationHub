# Code Comparison Instructions

Purpose: Provide a consistent, safe process to compare code across branches, commits, and directories, document differences, and propose minimal, correct patches.

## Scope
- Use for reviewing changes between branches, commits, releases, or local directories.
- Focus on smallest viable diff; avoid unrelated refactors.
- Respect repository style and contribution guidelines.

## Pre-Checks
- Ensure you’re on the intended branch: `git status` and `git branch`.
- Confirm clean working tree before generating diffs.
- Verify target comparison points (commit SHAs, tags, branches) exist.

## Comparison Types
- Branch vs Branch: `git diff <source_branch>...<target_branch>`
- Commit vs Commit: `git diff <sha1> <sha2>`
- Working tree vs HEAD: `git diff`
- Specific path: `git diff <ref1> <ref2> -- <path>`
- Directory comparison (non-git): Use tooling like `diff`, `meld`, or IDE compare.

## Standard Commands (PowerShell)
```powershell
# Show branch differences (three-dot to compare merge base)
git fetch
git diff <base>...<feature>

# File-level diff
git diff <base>...<feature> -- <relative\path\to\file>

# Show changed files summary
git diff --name-status <base>...<feature>

# View history for a file
git log --oneline -- <relative\path\to\file>

# Show blame for context
git blame <relative\path\to\file>
```

## Review Checklist
- Correct target: Comparing the intended refs and paths.
- Minimal changes: Avoid touching unrelated files.
- Style consistency: Match existing formatting and naming.
- Backward compatibility: Preserve public APIs unless required.
- Tests impact: Identify affected tests and add/adjust as needed.
- Security: Watch for secrets, unsafe patterns, or vulnerable code.
- Performance: Flag hotspots or regressions when relevant.

## Documenting Differences
Include a concise summary with:
- Context: What was changed and why.
- Impacted files: List with brief notes.
- Key diffs: Bullet highlights of logic changes.
- Risks: Edge cases, compatibility, or migration steps.
- Follow-ups: Any deferred improvements.

## Proposing Patches
- Prefer smallest diff that solves the issue.
- Avoid renames unless essential; they complicate reviews.
- Keep changes isolated to the relevant modules.
- Update README/config/docs if behavior changes.

## Using apply_patch (VS Code Agent)
- Use `apply_patch` with minimal, focused edits.
- Provide context before and after changed lines.
- Avoid reformatting untouched code.
- After patching, run linters/tests if available.

## Verification Steps
- Build/tests: Run locally if the project supports it.
- Lint/format: Apply repo-standard tools to changed files only.
- Manual check: Open changed components to validate behavior.

## Output Template
When sharing results, structure your message:
- Summary: One paragraph of the change intent.
- Diffs: Short bullets of key modifications.
- Files: Paths of edited/added/removed files.
- Commands: Any steps run locally.
- Next Steps: What to verify or extend.

## Power BI-Specific Notes (if applicable)
- For `.pbip` and `.pbir`: Avoid editing binary artifacts; prefer source folders under `definition/` and `SemanticModel/`.
- For `.tmdl` and model files: Keep DAX/relationships changes minimal and documented.
- Confirm dataset/report alignment after changes with Power BI Desktop or Fabric workflows.

## Safety & Compliance
- No secrets in code or diffs.
- Follow Microsoft content policies and avoid disallowed content.
- Respect licensing; do not copy external code without approval.

## Non‑Hallucination & User Confirmation
- Source of truth: Only report changes we can directly observe via Git or visible files in the workspace. Do not infer or speculate.
- Ask when unsure: If additional context is needed (e.g., files outside reach, private configs, or undocumented behavior), explicitly ask the user for the missing info or access.
- Access limits: If a specific related file cannot be reached, state the limitation and request the path or content from the user before proceeding.
- README option: After presenting a change summary, ask the user whether to store it in a README. If yes, confirm the target location/path and filename before writing.

## Tips
- Use three-dot diff (`base...feature`) to compare against merge base.
- Start with `--name-status`, then deep-dive into critical files.
- Keep notes while reviewing; they feed directly into the output template.

## Output Addendum (Storage)
- Ask the user if they want the change summary saved to a README.
- If they say yes, confirm the destination path and filename, then create/update the file accordingly.
