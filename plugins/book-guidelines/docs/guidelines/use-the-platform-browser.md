# Use the Platform — Browser

Stack-specific companion to `use-the-platform.md`. Read that file first; this one names the
concrete web-standard APIs the policy there applies to.

## Standard Library First

You MUST prefer web standards over a library: custom elements, `<template>`, `<dialog>`,
CSS custom properties, nesting, `:has()`, container queries, `fetch`, `AbortController`,
`URL` / `URLSearchParams`, `Intl`, `structuredClone`.
