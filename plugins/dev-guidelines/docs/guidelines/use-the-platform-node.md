# Use the Platform — Node.js

Stack-specific companion to `use-the-platform.md`. Read that file first; this one names the
concrete Node.js / web-platform APIs the policy there applies to.

## Standard Library First

- You MUST check Node's built-ins and the web-platform APIs it exposes before reaching for
  a package. `fetch`, `AbortController`, `URL` / `URLSearchParams`, `structuredClone`,
  `Intl`, `node:crypto`, `node:test`, `node:fs/promises`, `node:path`, `node:util`
  (`parseArgs`, `promisify`) cover most of what utility packages are pulled in for.
- A helper that reimplements UUID generation, deep cloning, path joining, or argument
  parsing MUST be replaced by the platform call.

## Framework Capability Over a Parallel One

Use the capability the framework already provides rather than a parallel one: NestJS's DI
container for wiring, its `ConfigModule` for configuration, `class-validator`/`ValidationPipe`
for input constraints (where NestJS is in use), the framework's built-in exception filters
for error mapping.
