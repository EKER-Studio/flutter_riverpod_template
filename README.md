# 🚀 Flutter GitHub Template — Clean Architecture, Riverpod 3.x & Isar Community

A razor-sharp, minimalist Flutter GitHub Template built strictly on 3 core pillars:
1. **Clean Architecture** (Feature-First)
2. **Riverpod 3.x** (`riverpod_annotation` & `@riverpod` code generation)
3. **Isar Community** (High-performance local database & reactive streams)

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
├── main.dart                    # Entry point (Isar initialization & ProviderScope)
├── app.dart                     # MaterialApp configuration
├── core/
│   ├── errors/                  # Domain Failure hierarchy
│   └── providers/               # Global providers
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
dart run build_runner build --delete-conflicting-outputs

# Execute full verification pipeline
bash before_push.sh
```

## 🧪 Verification

```bash
# Format check
dart format --output=none --set-exit-if-changed lib test bin scripts

# Static analysis
flutter analyze

# Unit, Widget & Golden tests
flutter test
```



