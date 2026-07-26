# AI Agent Project Rules

## Universal Conventions
*(These apply to every project regardless of tech stack — keep this section identical across repos.)*

### Language
All technical comments, documentation, and logic descriptions in the codebase MUST be written in English.

### Documentation Convention
For every public class/method, add a doc comment following the language's standard doc format (e.g. dartdoc for Dart, JSDoc for TypeScript):
- One sentence summarizing purpose (don't repeat the class/method name).
- One line per non-trivial parameter (`@param` or equivalent).
- Return value documentation only if it isn't obvious from the type.
- NO code examples unless the logic is genuinely non-obvious.
- Do not document trivial getters/setters or self-explanatory boilerplate.

### Scope Discipline
- Only read, open, or modify files explicitly named in the task, or files directly imported/referenced by them.
- Do NOT explore or edit files outside the stated scope without first asking for confirmation.
- Exception — the following do NOT require asking first, as they are natural consequences of a task, not scope expansion:
  - Regenerating/updating codegen output files (e.g. `.g.dart`) that correspond to a modified source file.
  - Updating an existing test file that directly tests the modified code, when needed to keep the Mandatory Verification Pipeline passing.
- If the task seems to require touching files beyond the stated scope AND beyond the exceptions above, STOP and report which additional files you believe are needed, and why — before making changes.

### Ambiguity Handling
- If a requirement is ambiguous or underspecified, state your interpretation/assumption explicitly before proceeding, rather than silently guessing.
- Prefer asking one direct clarifying question over implementing multiple speculative variants.

### Dependency Changes
- Do NOT add, remove, or upgrade a dependency without explicitly flagging it in your response (name, version, reason).
- Never introduce a new dependency to solve a problem that can be reasonably solved with existing project dependencies or stdlib.

### Git & Version Control
- Once the full Mandatory Verification Pipeline has passed (all steps green, zero errors, zero failing tests) for a completed, atomic logical change, commit it without asking for permission first.
- Do NOT commit if any pipeline step failed, was skipped, or could not be run — stop and report instead, per Guardrails and Verification Honesty above.
- Write descriptive, atomic commit messages (what changed and why, not just "fix").
- NEVER force-push, rewrite shared history, or delete branches without explicit confirmation.

### Security
- NEVER hardcode API keys, tokens, passwords, or other secrets in source code.
- NEVER commit `.env` files or other files containing local secrets.
- Use environment variables / the platform's secure storage mechanism for anything sensitive.

### Verification Honesty
- NEVER report that a verification step (build, analyze, lint, test) passed unless you actually executed it in this session and observed the output.
- If a step cannot be run (e.g. missing tool, sandboxed environment limitation), say so explicitly instead of assuming or claiming success.
- Do not fabricate or paraphrase tool output — quote or summarize only what was actually returned.

### Debug Artifact Cleanup
- Remove debug print/log statements and commented-out code introduced during iteration before considering a task complete, unless explicitly asked to leave them for further debugging.
- Do not leave stray TODO comments describing unfinished work without flagging them explicitly in your final summary.

### Guardrails
- NEVER delete, skip, or weaken a test to make the verification pipeline pass. Fix the underlying code instead.
- NEVER add lint-suppression comments (e.g. `// ignore:`) or disable analyzer/linter rules to silence errors, unless explicitly instructed.
- If a fix is not obvious after 2 attempts, stop and report the exact error instead of applying a workaround.

### Formatting & Style
- Follow the official style guide / formatter for the language in use (e.g. `dart format .`).
- Ensure all generated files are correctly linked/imported per the framework's conventions (e.g. `part 'filename.g.dart';` for Dart build_runner output).

---

## Project Stack: flutter_riverpod_boilerplate
*(Replace this whole section when starting a new project with a different stack.)*

### Build & Generation Commands
| Command | Purpose |
|---------|---------|
| `flutter pub get` | Install dependencies |
| `dart run build_runner build --delete-conflicting-outputs` | Generate Riverpod + Isar code |
| `flutter gen-l10n` | Regenerate localization if ARB files changed |
| `dart format --output=none --set-exit-if-changed lib test bin scripts` | Check formatting |
| `flutter analyze` | Static analysis |
| `dart run custom_lint` | Riverpod-specific lints — **separate from `flutter analyze`, do not skip** |
| `flutter test` | Run tests (`--tags=golden` to run golden tests only) |
| `bash before_push.sh` | Full pre-push pipeline |

### Architecture & Layer Boundaries
Feature-First Clean Architecture under `lib/features/<feature>/`. Two features currently exist: `todos` (CRUD with streams) and `settings` (singleton Isar collection, id=0). Global providers live under `lib/core/providers/`.

- **Domain Layer** (`lib/features/<feature>/domain/`): Pure Dart — entities, repository interfaces, use cases. NO Flutter or Riverpod imports allowed here.
- **Data Layer** (`lib/features/<feature>/data/`): Repository implementations, Isar models, and **synchronous** mappers (extensions).
- **Presentation Layer** (`lib/features/<feature>/presentation/`): UI (`ConsumerWidget`) and state management via Riverpod 3.x generators (`@riverpod`).
- **State Management:** Riverpod 3.x strictly.
- **Data Flow:** UI (`ConsumerWidget`) -> Notifier (`@riverpod`) -> Repository Interface (domain) -> Repository Impl (data) -> Local DB (`isar_community`).
- **Reactivity:** Handled purely via Isar streams. Notifiers listen to Isar collections and pipe data directly into `AsyncValue` state.

### Riverpod 3.x + Isar Community Patterns (repo-specific)
- **Always** use `@riverpod` code generation — never manual state mutation.
- State is **stream-driven**: notifiers listen to Isar collections and pipe into `AsyncValue`. No manual `state = ...` in CRUD methods.
- **I/O isolation:** mappers are synchronous, stateless extensions — they never execute I/O.
- **Single source of truth:** screens subscribe by ID via `.family(id)` providers.
- Use `isar_community` (not `isar`) — the original `isar` package conflicts with `riverpod_generator`.

### Constraints
- Dart 3.12+ features (records, patterns, class modifiers) replace Freezed/Equatable — do not introduce those packages as dependencies without flagging it first (per Dependency Changes above).
- `custom_lint` rule `avoid_infrastructure_imports_in_presentation` enforces layer boundaries.
- **Isar initialization:** Always use `Isar.getInstance() ?? await Isar.open(...)` to prevent dual-open errors.

### Lifecycle & Resource Disposal Checklist
Before considering any feature involving streams, timers, or animations complete, verify:
- Every `StreamSubscription` is cancelled in `dispose()` or the corresponding Notifier's `ref.onDispose()`.
- Every `Timer` or `AnimationController` is cancelled/disposed the same way to prevent memory leaks.
- All Isar dynamic query streams are properly closed or managed via Riverpod's auto-dispose mechanism.

### Testing Conventions
- **Unit tests:** notifier state transitions, CRUD logic, subscription cancellation.
- **Widget tests:** fake repositories injected via `ProviderContainer`.
- **Golden tests:** tagged `golden` in `dart_test.yaml`. Run with `flutter test --tags=golden`.
- **Fixtures:** `test/helpers/fake_todo_repository.dart`, `test/helpers/fake_user_preferences_repository.dart`.

### Generated Files
- `*.g.dart` files come from `build_runner` and are excluded from analysis (`analysis_options.yaml`).
- `lib/l10n/` generated localization — run `flutter gen-l10n` if ARB files change.

### Mandatory Verification Pipeline
After any modification within the `lib/**` directory, you MUST execute the following pipeline in strict order:
1. `dart run build_runner build --delete-conflicting-outputs`
2. `dart format --output=none --set-exit-if-changed lib test bin scripts`
3. `flutter analyze`
4. `dart run custom_lint`
5. `flutter test`

A task is NOT considered complete until all steps pass with zero errors and zero failing tests, AND the Lifecycle & Resource Disposal Checklist above has been explicitly verified. Fix any arising issues autonomously, subject to the Guardrails above.
