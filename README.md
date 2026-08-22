# eng-guidelines

Claude Code plugin marketplace for engineering skills that don't belong to any single
project — a personal catalog, installed once per machine and shared with the team via
this repo, instead of copy-pasted into every project scaffold.

This repo is public and MIT-licensed (see `LICENSE`). Vendored third-party content
keeps its own license and attribution — see `ATTRIBUTION.md` at the root and in
`plugins/architecture/` and `plugins/quarkus-tooling/`.

## Plugins

- **`dev-guidelines`** — book-derived guidelines (Clean Code, Clean Architecture,
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
  frontend (web-components, BCE) doctrine, adapted from Adam Bien's
  [airails](https://github.com/AdamBien/airails) and modified here (MIT, see
  `plugins/architecture/ATTRIBUTION.md`). Carries no links into any single project's
  own docs, so it installs anywhere unchanged.
- **`quarkus-tooling`** — vendored third-party `quarkus` and `keycloak-administration`
  skills, MIT-licensed (see `plugins/quarkus-tooling/ATTRIBUTION.md`). Vendored rather
  than pinned per project so that "install once, every project" holds for real — the
  same tradeoff `dev-guidelines` makes for its ciembor-sourced content.

## Install

```
/plugin marketplace add stilnox255/eng-guidelines
/plugin install dev-guidelines@ingo-eng-guidelines
/plugin install epic-workflow@ingo-eng-guidelines
/plugin install architecture@ingo-eng-guidelines
/plugin install quarkus-tooling@ingo-eng-guidelines
```

Team members repeat the same commands once; updates then arrive via `git pull` on the
marketplace, not by re-copying files into each project.

## Recommended companions

Two marketplaces worth installing alongside this one. They are recommendations rather
than entries in this marketplace on purpose: listing a third-party plugin here would
mean vouching for it and shipping every upstream change to whoever installs from this
repo. Both are better served staying where they are maintained.

**[ponytail](https://github.com/DietrichGebert/ponytail)** (MIT) — forces the laziest
solution that actually works: YAGNI, stdlib before custom code, native platform features
before dependencies, one line before fifty. It covers roughly the half that
`use-the-platform` deliberately leaves out. That omission was a maintenance decision, not
a disagreement: ponytail is a far more actively maintained project than this catalog, so
duplicating it here would only produce a fork that drifts.

```
/plugin marketplace add DietrichGebert/ponytail
/plugin install ponytail@ponytail
```

**[emvnuel/skills](https://github.com/emvnuel/skills)** (MIT) — Jakarta EE and Quarkus
skills: DDD, Panache smells, MapStruct, Lombok, GoF patterns, REST API design, testing
patterns. Note the overlap before installing: `clean-code-principles`,
`refactoring-catalog` and `cdd-design-pillars` cover ground that `dev-guidelines` already
covers from the same books, so both can trigger on the same task. Take it for the
Quarkus- and Jakarta-specific skills; the generic ones are duplicates.

```
/plugin marketplace add emvnuel/skills
/plugin install skills@emvnuel-skills
```

## Structure

```
plugins/
  dev-guidelines/
    skills/<name>/SKILL.md
    docs/guidelines/*.md      — read via ${CLAUDE_PLUGIN_ROOT}/docs/guidelines/...
    hooks/session-start.sh    — SessionStart hook, always-on injection
    hooks/hooks.json
  epic-workflow/
    skills/<name>/SKILL.md
  architecture/
    skills/<name>/SKILL.md
    ATTRIBUTION.md
  quarkus-tooling/
    skills/<name>/SKILL.md
    ATTRIBUTION.md
```

Adding a plugin: new folder under `plugins/`, its own `.claude-plugin/plugin.json`, and
an entry in the root `.claude-plugin/marketplace.json`'s `plugins` array. Changing a
plugin's content without bumping its `version` in `plugin.json` means `claude plugin
update` reports nothing to do — bump on every change, even a small one.
