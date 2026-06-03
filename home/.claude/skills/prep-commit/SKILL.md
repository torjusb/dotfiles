---
name: prep-commit
description: Drafts a commit message for the currently staged changes and writes it to <gitdir>/PREP_COMMIT_MSG so the next `git commit` opens the editor with it prefilled (via the global prepare-commit-msg hook). Use when the user asks to prepare, draft, or write a commit message without actually committing — e.g. "write a commit message", "prep the commit", "draft a commit".
effort: medium
---

# Prep Commit

Draft a commit message for the currently staged changes and write it to `<gitdir>/PREP_COMMIT_MSG`. Do NOT run `git commit`.

A global `prepare-commit-msg` hook at `~/.config/git/hooks/prepare-commit-msg` reads that sidecar file and prepends it into the commit editor when the user runs plain `git commit`. The hook deletes the sidecar after consuming it, so each draft is one-shot.

Do NOT write to `<gitdir>/COMMIT_EDITMSG`. Git overwrites that file with a fresh template every time `git commit` runs, so anything written there is clobbered before the editor opens.

## Input

Optional argument: a short hint/angle the user wants emphasized in the message (e.g. `/prep-commit "focus on the perf win"`). If present, use it to steer tone and framing — but still anchor the message in what the diff actually shows.

## Steps

Run these in parallel first:

1. `git rev-parse --git-dir` — resolves the real gitdir (handles worktrees where `.git` is a file). The target path is `<gitdir>/PREP_COMMIT_MSG`.
2. `git diff --cached --stat` — check there are staged changes and get a per-file summary.
3. `git log -20 --format="%s"` — sample the repo's commit style.

Then:

4. If nothing is staged, tell the user and stop. Do NOT fall back to unstaged changes and do NOT stage anything yourself.
5. Read the staged diff: `git diff --cached`. If it exceeds ~2000 lines, rely on the `--stat` summary plus the diffs of the largest / most semantically important files rather than ingesting everything.
6. Draft the message.
7. Persist the message by **actually invoking the `Write` tool** on `<gitdir>/PREP_COMMIT_MSG`. This is not optional and cannot be replaced by output text claiming the file was written. If the file already exists, Read it first (Write tool requirement) and then Write. Do step 8 only after the Write tool call has returned successfully.
8. Report: show the drafted message back to the user, confirm the path it was written to, and tell them they can run `git commit` (no `-m`) to use it — or edit it first.

## Style rules

Match the repo. Before drafting, infer from the recent subjects:

- Imperative vs past tense? (this repo: imperative, e.g. "Sync stores…", "Upgrade to…")
- Sentence case vs lowercase? (this repo: sentence case)
- Conventional-commits prefix (`feat:`, `fix:`) — use only if recent history uses it
- Language (English, Norwegian, …)
- Typical subject length

Defaults when history is ambiguous:

- Subject: imperative, ≤72 chars, no trailing period.
- Body: include only when the _why_ is non-obvious or the change is substantial. Separate from subject with a blank line. Wrap at ~72 chars. Explain _why_, not _what_.
- No signatures, no "Generated with Claude", no emojis unless the repo history uses them.
- Don't list touched files in the body — `git commit` already shows that in the editor.
- Don't invent ticket numbers; only include one if the branch name or diff references it.

## Do not

- Run `git commit`, `git add`, `git stage`, or any mutating git command.
- Write the message anywhere other than `<gitdir>/PREP_COMMIT_MSG`.
- Include commentary/preamble inside the commit message itself (lines starting with `#` are fine — git strips them — but don't rely on that; keep the message clean).
