# Flutter DPR Intern Task

A simple Flutter application implementing **Login, Project List, and DPR Submission** screens using **Clean Architecture and BLoC state management**.

---

## DEMO VIDEO LINK

A short **Loom video** explaining the implementation is provided along with the repository submission.

Loom link : https://www.loom.com/share/817961418b3641d08bc20e7f80361118

## Tech Stack

- **Flutter** (3.43.0)
- **Dart** (3.12.0)
- **BLoC** for state management
- **GoRouter** for navigation
- **Image Picker** for photo uploads
- **Clean Architecture** (Domain / Data / Presentation layers)

---

## Features

### 1. Login Screen

- Email & Password fields
- Mock authentication
  - Email: `test@test.com`
  - Password: `123456`

- Error message on invalid login

### 2. Project List Screen

- Static list of projects
- Displays:
  - Project Name
  - Status
  - Start Date

- Card-based UI
- Tap project → Open DPR form

### 3. DPR Form Screen

- Project dropdown (preselected from tapped project)
- Date picker
- Weather dropdown
- Work description (multiline)
- Worker count input
- Photo upload (1–3 images)
- Submit button with validation
- Success confirmation on submission

---

## Architecture

The project follows **Clean Architecture**:

Each feature is organized as:

```
features/
 ├ auth
 ├ project
 └ dpr
```

---

## State Management

- **BLoC** used for authentication, project loading, and DPR submission.
- Validation logic handled in the **Bloc layer**, keeping UI simple.

---

## Branching Strategy

This project follows a simple **feature-branch workflow**.

```
main
 └── dev
      ├── feature/auth
      ├── feature/projects
      └── feature/dpr
```

### Workflow

1. `main`
   - Stable production-ready code.

2. `dev`
   - Integration branch where features are merged.

3. `feature/*`
   - Each feature is developed in its own branch.

Example workflow:

```
git checkout dev
git checkout -b feature/auth
```

After completing a feature:

```
feature/auth → Pull Request → dev
```

Finally:

```
dev → Pull Request → main
```

## Setup & Run

### 1. Clone repository

```
git clone <repository-url>
cd flutter_intern_task
```

### 2. Install dependencies

```
flutter pub get
```

### 3. Run the app

```
flutter run
```

---

## Implemented

- Clean architecture folder structure
- BLoC based state management
- Navigation using GoRouter
- Modular widgets
- Form validation
- Image upload
- Responsive layout

---

## Not Implemented

- Persistent local storage (data stored in memory)

---

## Known Limitations

- DPR submissions are stored **in-memory only** and reset when the app restarts.
- Project list is **mocked/static data**.

---
