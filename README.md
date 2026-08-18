# eng-guidelines

Claude Code plugin marketplace for engineering skills that don't belong to any single
project — a personal catalog, installed once per machine and shared with the team via
this repo, instead of copy-pasted into every project scaffold.

## Plugins

- **`book-guidelines`** — book-derived guidelines (Clean Code, Clean Architecture,
  PoEAA, High-Performance Java Persistence, Modern Software Engineering, Philosophy of
  Software Design) plus generic PR-review/prototyping/behavioral skills.
- **`epic-workflow`** — idea capture through epic definition, planning, and task
  execution, with GitHub Projects V2 sync. Parameterized per project via that project's
  own `CLAUDE.md` (e.g. its "GitHub Project Integration" section) — install it and it
  adapts, no edits needed here.

Both extracted from the `demo` scaffold repo — neither carried a dependency on that
project's domain, so both were duplicated dead weight in every project scaffolded
from it.

Deliberately excludes `quarkus`, `quarkus-panache-smells`, `keycloak-administration`:
those are already tracked per-project by a skill installer (`skills-lock.json` +
`.agents/skills/`, symlinked into `.claude/skills/`), with their own GitHub source and
hash per skill. Forking them in here would fork that provenance/update path too.

`backend`/`frontend` (Quarkus/Hexagonal, web-components/BCE) also stay out: they carry
hard links into `demo`'s own ADRs (e.g. `backend`'s exception-mapper-logging rule links
straight to `ADR-14` in that repo). They're the scaffold's flesh, not a floating
guideline — the unit of reuse for those is cloning `demo` itself, not this plugin.

## Install

```
/plugin marketplace add stilnox255/eng-guidelines
/plugin install book-guidelines@ingo-eng-guidelines
/plugin install epic-workflow@ingo-eng-guidelines
```

Team members repeat the same commands once; updates then arrive via `git pull` on the
marketplace, not by re-copying files into each project.

## Structure

```
plugins/
  book-guidelines/
    skills/<name>/SKILL.md
    docs/guidelines/*.md   — read via ${CLAUDE_PLUGIN_ROOT}/docs/guidelines/...
  epic-workflow/
    skills/<name>/SKILL.md
```

Adding a plugin: new folder under `plugins/`, its own `.claude-plugin/plugin.json`, and
an entry in the root `.claude-plugin/marketplace.json`'s `plugins` array.
