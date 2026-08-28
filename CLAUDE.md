# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project overview

A Flutter learning/demo app: each screen showcases one Material widget or UI pattern (buttons, cards, progress indicators, snackbars/dialogs, animated container, UI controls, app tutorial/onboarding, infinite scroll with pull-to-refresh). There is no backend, state-management library, or persistence — every screen is self-contained.

## Commands

- `flutter pub get` — install dependencies after cloning or editing `pubspec.yaml`.
- `flutter run` — run the app on a connected device/emulator.
- `flutter analyze` — static analysis (uses `package:flutter_lints/flutter.yaml`, configured in `analysis_options.yaml`).
- `dart format lib` — format code.
- `flutter test` — run tests (there is currently no `test/` directory; add one with `flutter_test` if tests are introduced).
- `flutter build apk` / `flutter build ios` — production builds.

## Architecture

Everything lives under `lib/config/`:

- `router/app_router.dart` — single `GoRouter` instance (`appRouter`) with all routes, each keyed by a `name` static constant on the corresponding screen widget.
- `presentation/screen/<feature>/<feature>_screen.dart` — one folder per feature/screen. Each screen widget defines a `static const name` used as its route name, and a private `_XxxView`/`_XxxState` widget holds the actual body content.
- `presentation/screen/screens.dart` — barrel file that `export`s every screen; `app_router.dart` and other consumers import screens through this file rather than individual paths.
- `menu/menu_items.dart` — declares `appMenuItems`, the list of `MenuItem` entries (title, subtitle, route link, icon) rendered on the home screen. This list is the single source of truth for the home menu.
- `theme/app_theme.dart` — `AppTheme(selectedColor: n).getTheme()` builds a `ThemeData` from `colorSchemeSeed`, selecting from the fixed `colorList`. Wired into `MaterialApp.router` in `lib/main.dart`.

### Adding a new demo screen

1. Create `lib/config/presentation/screen/<feature>/<feature>_screen.dart` with a widget exposing `static const name = '<feature>_screen'`.
2. Add its export to `presentation/screen/screens.dart`.
3. Register a `GoRoute` for it in `router/app_router.dart` (path, `name: XxxScreen.name`, `builder`).
4. Add a corresponding `MenuItem` to `appMenuItems` in `menu/menu_items.dart` so it's reachable from the home list.

Navigation between screens uses `go_router`'s `context.push(...)` / `context.pop()`, not `Navigator` directly.

### Constructor style

This codebase (Dart 3.13.1 / Flutter 3.47.1) consistently declares unnamed constructors using the `new(...)` shorthand instead of repeating the class name, e.g.:

```dart
class ButtonsScreen extends StatelessWidget {
  const new({super.key});
  ...
}
```

This is intentional and used everywhere in `lib/` — match it in new code rather than "correcting" it to `const ButtonsScreen({super.key})`.

### Assets

Images referenced by screens (tutorial slides, infinite-scroll placeholder) live in `assets/Images/` and are declared under `flutter.assets` in `pubspec.yaml`.
