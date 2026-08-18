# Use the Platform — Python

Stack-specific companion to `use-the-platform.md`. Read that file first; this one names the
concrete Python standard library APIs the policy there applies to.

## Standard Library First

- You MUST check the standard library before reaching for a package. `pathlib`,
  `dataclasses` / `typing.NamedTuple`, `datetime` (`fromisoformat`), `functools`
  (`lru_cache`, `cached_property`, `reduce`), `itertools`, `collections`
  (`defaultdict`, `Counter`, `ChainMap`), `contextlib`, `enum`, `json`, `hashlib`, `secrets`,
  `argparse`, `unittest.mock` cover most of what utility packages are pulled in for.
- A helper that reimplements path joining, deep copying, retry/backoff loops, or CLI
  argument parsing MUST be replaced by the platform call.

## Framework Capability Over a Parallel One

Use the capability the framework already provides rather than a parallel one: the
framework's DI/dependency-override mechanism (e.g. FastAPI's `Depends`, Django's app
registry), its settings/config system, its validation layer (e.g. Pydantic where the
framework already uses it) for input constraints, and its ORM's migration tooling instead
of hand-rolled schema scripts.
