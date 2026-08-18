# Use the Platform — PHP

Stack-specific companion to `use-the-platform.md`. Read that file first; this one names the
concrete PHP standard library / SPL APIs the policy there applies to.

## Standard Library First

- You MUST check PHP's standard library and bundled extensions before reaching for a
  Composer package. `DateTimeImmutable`, `filter_var`, `password_hash` / `password_verify`,
  `hash`, `Random\Randomizer`, `array_*`/`str_*` functions, SPL data structures
  (`ArrayObject`, `SplStack`, `SplQueue`) cover most of what utility packages are pulled in
  for.
- A helper that reimplements date parsing, UUID/random-token generation, or password
  hashing MUST be replaced by the platform call.

## Framework Capability Over a Parallel One

Use the capability the framework already provides rather than a parallel one: the
framework's DI container for wiring (e.g. Symfony's service container, Laravel's), its
config layer for configuration, its validation component for input constraints, PSR-7/PSR-15
for HTTP messages and middleware where the framework follows those standards.
