# Restroom Rate Project

## Project Overview
**Restroom Rate** is a Flutter-based Android application designed to operate as a kiosk device inside restrooms. Its primary purpose is to allow users to quickly rate the cleanliness and their overall experience using a 5-point emoji scale. 

The application consists of two main screens:
1. **Rating Screen:** Displays a prompt and 5 interactive emoji buttons (1 - Terrible to 5 - Excellent).
2. **Thank You Screen:** Briefly displays a gratitude message after a rating is submitted before auto-redirecting back to the Rating Screen.

All submitted ratings are securely stored in real-time using **Firebase Cloud Firestore** under the collection structure: `rooms/{roomId}/ratings/{documentId}`.

## Main Technologies
*   **Framework:** Flutter (Dart)
*   **Target Platform:** Android (Optimized for tablets/kiosks)
*   **Backend / Database:** Firebase Cloud Firestore
*   **Key Packages (Planned):** `firebase_core`, `cloud_firestore`, `wakelock_plus` (for keeping the kiosk screen awake)

## Project Status
The project is currently in its initial phase. The standard Flutter counter template is present in `lib/main.dart`, and the core requirements have been outlined in `PRD.md`. 

The development will proceed in four phases according to the PRD:
1.  **Phase 1:** Project & Firebase Setup
2.  **Phase 2:** UI Development
3.  **Phase 3:** Firebase Integration & Logic
4.  **Phase 4:** Kiosk Optimization & Polish

## Building and Running

### Prerequisites
*   Flutter SDK (^3.11.1)
*   Android Studio / Android SDK (for building the Android kiosk app)
*   A configured Firebase Project with an associated `google-services.json` file in `android/app/` (Task 1.2).

### Commands

**Run the app in debug mode (Emulator or Physical Device):**
```bash
flutter run
```

**Run tests:**
```bash
flutter test
```

**Build Android APK:**
```bash
flutter build apk --release
```

## Development Conventions & Guidelines
*   **State Management & Navigation:** Standard Flutter navigation (`Navigator` or `go_router`) will be used to switch between the Rating and Thank You screens.
*   **UI/UX:** The app must be designed in "immersive mode" (fullscreen) hiding the system navigation and status bars (`SystemChrome.setEnabledSystemUIMode`).
*   **Linting:** The project uses `flutter_lints`. Ensure code is clean and adheres to these standard Dart/Flutter linting rules. 
*   **Offline Support:** Firestore offline persistence must be maintained to ensure ratings are not lost during temporary Wi-Fi disconnections.
*   **Reference Document:** Always refer to the `PRD.md` file in the root directory for the complete task breakdown and architectural expectations.
