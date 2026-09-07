# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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

[1.1.0]: https://github.com/EKER-Studio/flutter_riverpod_boilerplate/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/EKER-Studio/flutter_riverpod_boilerplate/releases/tag/v1.0.0
