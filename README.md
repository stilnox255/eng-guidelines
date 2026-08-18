# eng-guidelines

Claude Code plugin marketplace for the engineering-guideline skills that don't belong
to any single project: book-derived guidelines (Clean Code, Clean Architecture, PoEAA,
High-Performance Java Persistence, Modern Software Engineering, Philosophy of Software
Design) plus generic PR-review/prototyping/behavioral skills.

Extracted from the `demo` scaffold repo — these skills carried no dependency on that
project's domain and were duplicated dead weight in every project scaffolded from it.

Deliberately excludes `quarkus`, `quarkus-panache-smells`, `keycloak-administration`:
those are already tracked per-project by a skill installer (`skills-lock.json` +
`.agents/skills/`, symlinked into `.claude/skills/`), with their own GitHub source and
hash per skill. Forking them in here would fork that provenance/update path too.

## Install

```
/plugin marketplace add <this-repo-url-once-pushed>
/plugin install eng-guidelines
```

Team members repeat the same two commands once; updates then arrive via `git pull`
on the marketplace, not by re-copying files into each project.

## Structure

- `skills/<name>/SKILL.md` — one skill per guideline/tool
- `docs/guidelines/*.md` — the binding policy text the book-derived skills read via
  `${CLAUDE_PLUGIN_ROOT}/docs/guidelines/...`
