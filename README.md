# ReClaim

**ReClaim** is a Flutter and Firebase mobile application for managing lost-and-found item reports within a campus community. The current implementation focuses on a reliable Phase 1 foundation with Firestore CRUD operations, real-time updates, validated forms, search, filtering, and a clean repository-based structure.

## Current Features

- Create, view, update, and delete lost or found item reports
- Display Firestore data through real-time streams
- Validate report forms before submission
- Search reports by item details
- Filter reports by type and category
- Show loading, empty, error, and success states
- Separate UI, model, and Firestore logic using repository architecture

## Technologies

- Flutter
- Dart
- Firebase Core
- Cloud Firestore
- Material 3
- Riverpod
- go_router

## Architecture

The project separates responsibilities into:

- **Presentation:** screens, forms, reusable widgets, and navigation
- **Models:** structured item report data and serialization
- **Repositories:** Firestore CRUD operations and real-time streams
- **Core:** shared constants, validation, error handling, and utilities

This structure keeps Firebase access outside the UI and makes the application easier to maintain and extend.

## Getting Started

### Prerequisites

- Flutter SDK
- Android Studio or VS Code
- Android emulator or physical device
- Firebase project with Cloud Firestore enabled

### Run the Project

```bash
git clone <repository-url>
cd reclaim
flutter pub get
flutter run
```

Firebase must be configured for the target platform before running the application.

## Project Status

Phase 1 is focused on the implemented Flutter and Firestore functionality. Authentication, image uploads, claims, smart matching, and notifications are not presented as completed features.

## Author

**Sandali Nanayakkara**  
Software Engineering Undergraduate  
University of Sri Jayewardenepura