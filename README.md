# 🚀 Flutter GitHub Template — Clean Architecture, Riverpod 3.x & Isar Community (v1.2.0)

[![Release](https://img.shields.io/badge/Release-v1.2.0-blue.svg)](CHANGELOG.md)
[![Flutter](https://img.shields.io/badge/Flutter-3.47+-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.12+-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![State](https://img.shields.io/badge/State-Riverpod_3.x-0553B1)](https://riverpod.dev)
[![Database](https://img.shields.io/badge/Database-Isar_Community-00B4D8)](https://isar-community.dev)
[![Routing](https://img.shields.io/badge/Routing-GoRouter-teal)](https://pub.dev/packages/go_router)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

A razor-sharp, minimalist, production-ready Flutter GitHub Template frozen strictly around 3 core pillars:
1. **Clean Architecture** (Feature-First)
2. **Riverpod 3.x** (`riverpod_annotation` & `@riverpod` code generation)
3. **Isar Community** (High-performance local database & reactive streams)

Includes an integrated minimal localization (l10n) blueprint.

---

## 🎯 Core Pillars

### 1. Clean Architecture
Organized by features (`lib/features/<feature>/`), isolating Domain logic from technical Data implementations and Presentation UI components:
- **Domain Layer**: Pure Dart entities and repository contracts.
- **Data Layer**: Isar models, synchronous mappers, and repository implementations.
- **Presentation Layer**: Riverpod state notifiers and Material3 UI widgets.

### 2. Riverpod 3.x
Strict code generation via `@riverpod` annotations. All state updates are stream-driven directly from persistence layers into `AsyncValue` state.

### 3. Isar Community
Ultra-fast, offline-first local database providing reactive queries and watch streams as the single source of truth.

---

## ✨ Features

- **Todo Management**: Complete reactive CRUD operations (add, toggle, delete).
- **Settings Module**: Dark mode and notification preferences backed by Isar singleton collection (`id=0`).
- **Testability**: Comprehensive unit, widget, and visual regression (Golden) tests.

---

## 🛠 Project Structure

```text
lib/
├── main.dart                    # Entry point (AppStartupWidget & ProviderScope)
├── app.dart                     # MaterialApp.router configuration
├── core/
│   ├── errors/                  # Domain Failure hierarchy & Result types
│   ├── presentation/            # AppTheme & AppStartupWidget (loading/error)
│   ├── providers/               # Global providers (isarProvider, appStartupProvider)
│   └── router/                  # GoRouter declarative routes (AppRoute & appRouterProvider)
└── features/
    ├── todos/                   # Feature: Todos
    │   ├── domain/              # Entities & Repository contracts
    │   ├── data/                # Isar models, Mappers & Repository impl
    │   └── presentation/        # Notifiers, Screens & Widgets
    └── settings/                # Feature: Settings
        ├── domain/              # User preferences domain contracts
        ├── data/                # Isar singleton model & Repository impl
        └── presentation/        # Settings Notifiers & Screens
```

---

## 🚀 Setup & Execution

```bash
# Fetch dependencies
flutter pub get

# Generate Riverpod & Isar code
dart run build_runner build

# Generate App Icons
dart run flutter_launcher_icons

# Generate Native Splash Screen
dart run flutter_native_splash:create

# Execute full verification pipeline
bash scripts/before_push.sh
```

## 🧪 Verification

```bash
# Format check
dart format --output=none --set-exit-if-changed lib test

# Static analysis
flutter analyze

# Unit, Widget & Golden tests
flutter test
```

---

## 📜 Changelog

All notable changes, architectural enhancements, and release notes are documented in [CHANGELOG.md](CHANGELOG.md).
