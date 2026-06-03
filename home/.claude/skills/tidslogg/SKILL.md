---
name: tidslogg
description: Generates a Norwegian-language breakdown of the user's work today (or another day), formatted for copy-pasting into a time-logging app. Use when the user asks for a "tidslogg", "timeføring", work summary, "hva har jeg gjort i dag", or wants to log hours. Output is always Norwegian.
---

# Tidslogg

Produce a concise, Norwegian summary of the user's work for a given day, ready to paste into a time-logging app.

## Input

The skill takes an optional argument:

- no argument → today
- `igår` / `yesterday` → yesterday
- weekday name (`mandag`, `tirsdag`, ...) → most recent matching weekday
- ISO date (`2026-04-22`)

Resolve the argument to a concrete start/end timestamp before querying git.

## Gathering the data

Run these in parallel from the current working directory:

1. `git config user.email` and `git config user.name` — to filter to this user's commits.
2. `git log --all --since="<start>" --until="<end>" --author="<email>" --format="%h|%ai|%s|%D" --no-merges` — commits by this user in the window, across all branches.
3. `git status --short` — uncommitted work.
4. `git diff --stat HEAD` — rough size of unstaged + staged changes.
5. `git branch --show-current` — the branch currently checked out (often signals what's in-progress).

If the user mentions other repos they worked in, repeat per repo. Otherwise stick to the current repo.

## Interpreting commits

- Group related commits into a single bullet. Don't emit one line per commit.
- Translate technical subjects into business-friendly Norwegian. "Fix null pointer in store indexer" → "Rettet feil i butikk-indeksering".
- Extract Jira-style keys (`PROJ-123`, `REMA-456`) from commit messages and keep them in the bullet as a reference.
- Ignore purely mechanical commits (merge commits, "wip", "fix typo") unless they're the only activity.
- **Log only actual product/code work.** Skip process/admin actions like opening or merging pull requests, pushing branches, writing commit messages, rebasing, tagging releases, updating PR descriptions, or running scripts. The time log is for what was built, not for git/GitHub activity around it. If a PR was opened, the work it contains is what gets logged — not the PR itself.

Only fetch Jira ticket titles via the Atlassian MCP (`mcp__atlassian__getJiraIssue`) if the user explicitly asks for enriched titles — it adds latency and isn't needed for a time log.

## Output format

Norwegian only. Keep it tight — time-logging fields are small. Print the block inside a fenced code block so it's easy to copy:

````
```
Tidslogg <dag og dato på norsk, f.eks. "onsdag 22. april 2026">

- <oppgave 1> (<evt. ticket-referanse>)
- <oppgave 2>
- ...

Uferdig:
- <kort beskrivelse>
```
````

Rules for the body:

- **The full code-block contents (between the fences, not counting the fences themselves) MUST be under 580 characters.** Count before emitting; if over, tighten wording, merge bullets, or drop the least important item until it fits. The time-logging field has a hard cap.
- No commit hashes, no branch names verbatim (translate the branch into a feature name if useful).
- Skip the `Uferdig:` section if there's no meaningful uncommitted work.
- If there's nothing at all: `Ingen registrert aktivitet <dato>.`
- Do not invent hour estimates — the user fills those in.

After the code block, add one short line outside it (not part of the paste) noting anything the user should double-check, e.g. meetings, PR reviews, or incidents that don't show up in git. Example: `Husk å legge til møter, PR-reviews eller annet som ikke ligger i git.`

## Example

Given commits today:

- `Sync stores from Zpinmedia feed and index them in Algolia` (REMA-482)
- `Add missing env variables to turbo config`

And an uncommitted map component on branch `butikkfinner-xml-sync`:

````
```
Tidslogg onsdag 22. april 2026

- Butikkfinner: synkronisert butikker fra Zpinmedia-feeden og indeksert dem i Algolia (REMA-482)
- Ryddet opp i miljøvariabler for Turbo-bygget
- Startet på kartvisning med Mapbox i butikkfinneren

Uferdig:
- Kartvisning (pågår)
```
````

Husk å legge til møter, PR-reviews eller annet som ikke ligger i git.
