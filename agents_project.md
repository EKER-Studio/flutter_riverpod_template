# Project-Specific Rules — flutter_riverpod_boilerplate (v1.2.0)

*Companion to `AGENTS.md`. Save this file as `agents_project.md` in this repo's root, next to `AGENTS.md`.
Frozen strictly around 3 pillars: Clean Architecture, Riverpod 3.x, and Isar Community, with an integrated
minimal l10n blueprint.*

### Build & Generation Commands
| Command | Purpose |
|---|---|
| `flutter pub get` | Install dependencies |
| `flutter gen-l10n` | Regenerate localization if ARB files changed |
| `dart run build_runner build` | Generate Riverpod + Isar code |
| `dart run flutter_launcher_icons` | Generate app icons (Android + iOS) from `assets/icon/` |
| `dart run flutter_native_splash:create` | Generate native splash screens from `assets/icon/` |
| `dart format lib test` | Format code |
| `flutter analyze` | Static analysis |
| `flutter test` | Run tests (`--tags=golden` to run golden tests only) |
| `bash scripts/before_push.sh` | Full pre-push pipeline |

### Architecture & Layer Boundaries
Feature-First Clean Architecture under `lib/features/<feature>/`. Two features currently exist: `todos`
(CRUD with streams) and `settings` (singleton Isar collection, id=0). Global providers live under
`lib/core/providers/`, and declarative routing is configured under `lib/core/router/` using `GoRouter`.

- **Domain** (`lib/features/<feature>/domain/`): Pure Dart — entities, repository interfaces, use cases. NO
  Flutter or Riverpod imports allowed here.
- **Data** (`lib/features/<feature>/data/`): Repository implementations, Isar models, and **synchronous**
  mappers (extensions).
- **Presentation** (`lib/features/<feature>/presentation/`): UI (`ConsumerWidget`) and state management via
  Riverpod 3.x generators (`@riverpod`).
- **State Management:** Riverpod 3.x strictly.
- **Data Flow:** UI (`ConsumerWidget`) → Notifier (`@riverpod`) → Repository Interface (domain) → Repository
  Impl (data) → Local DB (`isar_community`).
- **Reactivity:** Handled purely via Isar streams. Notifiers listen to Isar collections and pipe data
  directly into `AsyncValue` state.

### Riverpod 3.x + Isar Community Patterns
- **Always** use `@riverpod` code generation — never manual state mutation.
- State is **stream-driven**: notifiers listen to Isar collections and pipe into `AsyncValue`. No manual
  `state = ...` in CRUD methods.
- **I/O isolation:** mappers are synchronous, stateless extensions — they never execute I/O.
- **Single source of truth:** screens subscribe by ID via `.family(id)` providers.
- Use `isar_community` (not `isar`) — the original `isar` package conflicts with `riverpod_generator`.

### Constraints
- Dart 3.12+ features (records, patterns, class modifiers) replace Freezed/Equatable — do not introduce
  those packages as dependencies without flagging it first (per `AGENTS.md` → Dependency Changes).
- **Isar initialization:** Always use `Isar.getInstance() ?? await Isar.open(...)` to prevent dual-open
  errors.

### Resource Lifecycle & Disposal (concrete items)
- Every `StreamSubscription` cancelled in `dispose()` or the corresponding Notifier's `ref.onDispose()`.
- Every `Timer` or `AnimationController` cancelled/disposed the same way to prevent memory leaks.
- All Isar dynamic query streams properly closed or managed via Riverpod's auto-dispose mechanism.

### Testing Conventions
- **Unit tests:** notifier state transitions, CRUD logic, subscription cancellation.
- **Widget tests:** fake repositories injected via `ProviderContainer`.
- **Golden tests:** tagged `golden` in `dart_test.yaml`. Run with `flutter test --tags=golden`.
- **Fixtures:** `test/helpers/fake_todo_repository.dart`, `test/helpers/fake_user_preferences_repository.dart`.

### Generated Files
- `*.g.dart` files come from `build_runner` and are excluded from analysis (`analysis_options.yaml`).

### Mandatory Verification Pipeline (concrete commands)
1. `dart run build_runner build`
2. `dart format lib test`
3. `flutter analyze`
4. `flutter test`

Once all 4 steps are green and the Resource Lifecycle checklist above is verified, commit per `AGENTS.md` →
Git & Version Control (autonomous commit is enabled for this repo, since this file exists).
