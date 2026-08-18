# eng-guidelines

Claude Code plugin marketplace for engineering skills that don't belong to any single
project — a personal catalog, installed once per machine and shared with the team via
this repo, instead of copy-pasted into every project scaffold.

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

All three extracted from the `demo` scaffold repo — none of it carried a dependency on
that project's domain, so all of it was duplicated dead weight in every project
scaffolded from it. A project's own ADRs (like `demo`'s `ADR-14`) stay where they are;
they record *that* a project adopted a convention, not the convention itself.

Deliberately excludes `quarkus`, `quarkus-panache-smells`, `keycloak-administration`:
those are already tracked per-project by a skill installer (`skills-lock.json` +
`.agents/skills/`, symlinked into `.claude/skills/`), with their own GitHub source and
hash per skill. Forking them in here would fork that provenance/update path too.

## Install

```
/plugin marketplace add stilnox255/eng-guidelines
/plugin install book-guidelines@ingo-eng-guidelines
/plugin install epic-workflow@ingo-eng-guidelines
/plugin install architecture@ingo-eng-guidelines
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
```

Adding a plugin: new folder under `plugins/`, its own `.claude-plugin/plugin.json`, and
an entry in the root `.claude-plugin/marketplace.json`'s `plugins` array. Changing a
plugin's content without bumping its `version` in `plugin.json` means `claude plugin
update` reports nothing to do — bump on every change, even a small one.
