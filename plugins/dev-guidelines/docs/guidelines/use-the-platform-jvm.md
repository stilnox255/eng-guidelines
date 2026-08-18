# Use the Platform — JVM

Stack-specific companion to `use-the-platform.md`. Read that file first; this one names the
concrete JDK / MicroProfile / Jakarta EE APIs the policy there applies to.

## Standard Library First

- You MUST check the JDK before reaching for a library. `BigDecimal`, `java.time`,
  `HexFormat`, `MessageDigest`, `HttpClient`, `Objects`, `Comparator`, `EnumMap` / `EnumSet`,
  the `Collectors` family and `String.formatted` cover most of what utility libraries are
  pulled in for.
- A helper that reimplements `String.join`, ISO-8601 parsing, or hex encoding MUST be
  replaced by the platform call.

## Framework Capability Over a Parallel One

Use the capability the framework already provides rather than a parallel one: CDI for
wiring, MicroProfile Config for configuration, MicroProfile Fault Tolerance for timeouts
and retries, Bean Validation for input constraints, JSON-P / JSON-B for JSON.
