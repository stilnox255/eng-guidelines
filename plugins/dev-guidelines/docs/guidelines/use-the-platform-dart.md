# Use the Platform — Dart / Flutter

Stack-specific companion to `use-the-platform.md`. Read that file first; this one names the
concrete Dart/Flutter SDK APIs the policy there applies to.

## Standard Library First

- You MUST check `dart:core`, `dart:async`, `dart:convert`, and the Flutter SDK before
  reaching for a package. `DateTime`, `Duration`, `Uri`, `json.encode`/`decode`, `Stream` /
  `StreamController`, `ValueNotifier`/`ChangeNotifier`, `Future.wait`, collection literals
  and `Iterable` methods cover most of what packages are pulled in for.
- Prefer Flutter's built-in widgets and state-management primitives (`ValueNotifier`,
  `InheritedWidget`, `Navigator`) before reaching for a state-management package; only add
  one (Riverpod, Bloc, ...) when the app's state complexity genuinely outgrows them.
- A helper that reimplements JSON (de)serialization boilerplate, debouncing, or basic
  form validation MUST be replaced by the platform/SDK call.

## Framework Capability Over a Parallel One

Use the capability Flutter already provides rather than a parallel one: its routing
(`Navigator`/`Router`) for navigation, `flutter_localizations`/`intl` for i18n, and the
platform channels for native interop instead of a hand-rolled bridge.
