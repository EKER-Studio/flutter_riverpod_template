# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.2.0] - 2026-09-08

### 🚀 Highlights & Features
* **CI/CD & Automated Release Pipeline:**
  * Adopted `develop` as the primary integration branch and default branch on GitHub.
  * Added dedicated `Release` workflow ([`release.yml`](.github/workflows/release.yml)) to build release APKs and automatically publish GitHub Releases on `v*` tags.
  * Enhanced CI test stability on Linux runners with dynamic caching and retrieval of the native `libisar.so` core binary.
  * Integrated automated test coverage calculation, summary tables in `$GITHUB_STEP_SUMMARY`, and `coverage/lcov.info` artifact reporting.
  * Aligned runner Flutter version to `3.47.2` for full Dart analyzer compatibility.
  * Added conditional release keystore signing via `key.properties` in Android Gradle with automatic fallback to debug keys.
* **Architecture & Clean Code Refinement:**
  * Relocated repository providers to the data layer (`lib/features/todos/data/providers/todo_repository_provider.dart`), adhering to clean architectural boundaries.
  * Comprehensive documentation and DartDoc cleanup across `core`, `todos`, and `settings` modules.
* **Developer Tooling & Architecture Audits:**
  * Added specialized AI audit prompts in `prompts/` covering Riverpod architecture, unit testing standards, i18n/l10n audits, and DartDoc cleanup.
  * Added GitHub Copilot project guidelines ([`.github/copilot-instructions.md`](.github/copilot-instructions.md)).
* **Repository Governance & Project Hygiene:**
  * Added standardized GitHub Issue and Pull Request templates for bugs, features, and chores.
  * Formalized contribution and release workflows in [`.github/CONTRIBUTING.md`](.github/CONTRIBUTING.md).
  * Hardened `.gitignore` against generated Android Kotlin caches and iOS SPM resolved artifacts.

## [1.1.0] - 2026-08-28

### 🚀 Highlights & Features
* **Declarative Routing (GoRouter):** Integrated `go_router` with centralized route definitions, eliminating direct cross-screen dependencies.
* **Architecture Evolution:** Implemented `AppStartup` initialization pattern for async database pre-warming and modernized error handling via `Result` / `Failure` abstractions.
* **Design System & Asset Pipeline:** Centralized `AppTheme`, adaptive icons, dynamic dark/light native splash screens, and asset normalization scripts.
* **CI/CD & Pre-Push Pipeline:** Automated code generation verification, static analysis, custom Riverpod lints, and test execution on pull requests.
* **AI-Native Tooling:** Added universal guardrail configs for Cline, Cursor (`.cursorrules`), Claude Code (`CLAUDE.md`), and Gemini (`GEMINI.md`).

## [1.0.0] - 2026-07-28

### Initial Release
* Minimalist production template frozen strictly around Clean Architecture, Riverpod 3.x, and Isar Community.
* Reactive CRUD Todo feature with Isar stream queries and auto-disposing Riverpod state notifiers.
* Settings feature with persistent theme mode using Isar singleton collection (`id=0`).
* Integrated localization (l10n) blueprint with English and Polish translations.
* Complete verification pipeline with unit, widget, and golden test coverage.

[1.2.0]: https://github.com/EKER-Studio/flutter_riverpod_boilerplate/compare/v1.1.0...v1.2.0
[1.1.0]: https://github.com/EKER-Studio/flutter_riverpod_boilerplate/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/EKER-Studio/flutter_riverpod_boilerplate/releases/tag/v1.0.0
