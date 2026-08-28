# widgets_app

A Flutter learning/demo app: each screen showcases one Material widget or UI pattern. There is no backend, state-management library, or persistence — every screen is self-contained.

## Screens

- **Buttons** — elevated, filled, outlined, text, and icon buttons, plus a custom button.
- **Cards** — card variants (default, outlined, filled, image) across elevation levels.
- **ProgressIndicator** — indeterminate and value-driven circular/linear progress indicators.
- **Snackbar** — snackbars, dialogs, and the built-in "about" dialog.
- **Animated container** — an `AnimatedContainer` that reshapes/recolors on tap.
- **UI controls** — switches, checkboxes, and a radio group.
- **App tutorial** — a swipeable onboarding flow with image slides.
- **Infinite scroll** — a paginated list with pull-to-refresh.

## Getting started

```bash
flutter pub get   # install dependencies
flutter run       # run on a connected device/emulator
```

Requires Flutter 3.47.1 / Dart ^3.13.1 (see `pubspec.yaml`).

## Development

- `flutter analyze` — static analysis (`flutter_lints`).
- `dart format lib` — format code.
- `flutter test` — run tests.

See [CLAUDE.md](CLAUDE.md) for architecture notes and conventions.
