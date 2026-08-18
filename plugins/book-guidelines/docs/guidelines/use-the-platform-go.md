# Use the Platform — Go

Stack-specific companion to `use-the-platform.md`. Read that file first; this one names the
concrete Go standard library APIs the policy there applies to.

## Standard Library First

- You MUST check the standard library before reaching for a module. `net/http`
  (`http.ServeMux` routing, `http.Client`), `context`, `errors` (`errors.Is`/`As`,
  `errors.Join`), `encoding/json`, `time`, `slices`, `maps`, `sync` (`sync.WaitGroup`,
  `errgroup` is the one common exception), `testing` (with `testing/synctest` /
  table-driven tests) cover most of what modules are pulled in for.
- A helper that reimplements string building, slice deduplication, or basic HTTP routing
  MUST be replaced by the platform call.

## Framework Capability Over a Parallel One

Go's standard library is usually the framework. Where a framework is in use (e.g. a web
framework's router/middleware chain), use its capability rather than a parallel one for
that concern — but default to `net/http` and the standard library before adding a
framework at all.
