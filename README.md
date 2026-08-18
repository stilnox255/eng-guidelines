# eng-guidelines

Claude Code plugin marketplace for engineering skills that don't belong to any single
project — a personal catalog, installed once per machine and shared with the team via
this repo, instead of copy-pasted into every project scaffold.

**This repo is currently private, on purpose.** One plugin
(`quarkus-panache-smells`) only belongs here because of that — see its entry below
and its `ATTRIBUTION.md` before ever making this repo public or sharing access
beyond Ingo.

## Plugins

- **`book-guidelines`** — book-derived guidelines (Clean Code, Clean Architecture,
  PoEAA, High-Performance Java Persistence, Modern Software Engineering, Philosophy of
  Software Design, Release It!) plus generic PR-review/prototyping/behavioral skills.
  `release-it.md` and `use-the-platform.md` are injected at every session start via a
  `SessionStart` hook (same mechanism as the `ponytail` plugin) — they're binding
  policy for all code, not something that should wait for a topic-matched trigger.
- **`epic-workflow`** — idea capture through epic definition, planning, and task
  execution, with GitHub Projects V2 sync. Parameterized per project via that project's
  own `CLAUDE.md` (e.g. its "GitHub Project Integration" section) — install it and it
  adapts, no edits needed here.
- **`architecture`** — backend (Hexagonal Architecture, one class per use case) and
  frontend (web-components, BCE) doctrine. `backend` originally linked straight to
  `demo`'s `ADR-14` for its exception-mapper-logging convention; that table was already
  inlined in the skill, so the ADR link was just a rationale pointer, not the content
  itself — removed so the skill carries no project-specific link.

- **`quarkus-tooling`** — vendored third-party `quarkus` and `keycloak-administration`
  skills, MIT-licensed (see `plugins/quarkus-tooling/ATTRIBUTION.md`). Previously
  tracked per-project by a skill installer (`skills-lock.json` + `.agents/skills/` in
  `demo`, with a source repo + content hash per skill) — that gave drift detection in
  theory, but the actual installer CLI could never be confirmed running (silent no-op
  in every environment tried), so the "reproducible install" property was already
  theoretical. Vendoring here at least gets the "install once, every project" property
  for real, same tradeoff `book-guidelines` already made for its ciembor-sourced
  content.

- **`quarkus-panache-smells`** — **RESTRICTED LICENSE, private-repo-only.** Source
  (`emvnuel/skill.md`) has no LICENSE file and no license mention anywhere in the
  repo — default copyright, no redistribution permission. An issue is open asking
  the author to add one. Kept here as personal use only while this repo stays
  private, in its own plugin so it's never accidentally bundled with the
  MIT-licensed `quarkus-tooling` pair. **Remove this plugin before this repo is ever
  made public or shared**, unless the license question is resolved by then. See
  `plugins/quarkus-panache-smells/ATTRIBUTION.md`.

All extracted from the `demo` scaffold repo — none of it carried a dependency on that
project's domain, so all of it was duplicated dead weight in every project scaffolded
from it. A project's own ADRs (like `demo`'s `ADR-14`) stay where they are; they
record *that* a project adopted a convention, not the convention itself.

## Install

```
/plugin marketplace add stilnox255/eng-guidelines
/plugin install book-guidelines@ingo-eng-guidelines
/plugin install epic-workflow@ingo-eng-guidelines
/plugin install architecture@ingo-eng-guidelines
/plugin install quarkus-tooling@ingo-eng-guidelines
/plugin install quarkus-panache-smells@ingo-eng-guidelines   # private-repo-only, see above
```

Team members repeat the same commands once; updates then arrive via `git pull` on the
marketplace, not by re-copying files into each project.

## Structure

```
plugins/
  book-guidelines/
    skills/<name>/SKILL.md
    docs/guidelines/*.md      — read via ${CLAUDE_PLUGIN_ROOT}/docs/guidelines/...
    hooks/session-start.sh    — SessionStart hook, always-on injection
    hooks/hooks.json
  epic-workflow/
    skills/<name>/SKILL.md
  architecture/
    skills/<name>/SKILL.md
  quarkus-tooling/
    skills/<name>/SKILL.md
    ATTRIBUTION.md
  quarkus-panache-smells/
    skills/quarkus-panache-smells/SKILL.md
    ATTRIBUTION.md            — restricted license, private-repo-only
```

Adding a plugin: new folder under `plugins/`, its own `.claude-plugin/plugin.json`, and
an entry in the root `.claude-plugin/marketplace.json`'s `plugins` array. Changing a
plugin's content without bumping its `version` in `plugin.json` means `claude plugin
update` reports nothing to do — bump on every change, even a small one.
