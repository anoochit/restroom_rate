# Restroom Rate Kiosk

**Restroom Rate** is a Flutter-based Android application designed to operate as a kiosk device inside restrooms. Its primary purpose is to allow users to quickly rate the cleanliness and their overall experience using a 5-point emoji scale.

All submitted ratings are securely stored in real-time using **Firebase Cloud Firestore**.

## 🚀 Features

*   **Quick Rating Interface:** A prominent 5-emoji scale (1 - Terrible to 5 - Excellent) for frictionless user feedback.
*   **Auto-Resetting Flow:** Instantly redirects to a brief "Thank You" screen upon rating, then automatically resets for the next user within 3 seconds.
*   **Kiosk Optimized:** 
    *   Runs in "immersive sticky" mode (full screen, system bars hidden).
    *   Utilizes wake locks to prevent the device screen from sleeping.
*   **Offline-First:** Explicitly enabled Firestore offline persistence ensures no ratings are lost during temporary Wi-Fi drops (common in restroom environments).
*   **Real-time Sync:** Automatically synchronizes queued local ratings to the cloud when connectivity is restored.

## 🛠 Tech Stack

*   **Framework:** Flutter & Dart
*   **Platform:** Android (Optimized for tablets/kiosks)
*   **Database:** Firebase Cloud Firestore
*   **Key Libraries:** `cloud_firestore`, `firebase_core`, `go_router` (navigation), `wakelock_plus`, `google_fonts`.

## 📦 Getting Started

### Prerequisites

1.  **Flutter SDK:** Ensure you have the Flutter SDK installed (>= 3.11.1).
2.  **Android Setup:** Android Studio and Android SDK installed for building the APK.
3.  **Firebase Project:** 
    *   Create a Firebase project in the console.
    *   Add an Android app to the project and download the `google-services.json` file.
    *   Place `google-services.json` in the `android/app/` directory.

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/anoochit/restroom_rate.git
   cd restroom_rate
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app (on a connected device or emulator):
   ```bash
   flutter run
   ```

### Building for Production

To build a release APK for deployment to a kiosk device:

```bash
flutter build apk --release
```

## 📂 Project Documentation

For more detailed information regarding the development phases, architecture, and post-development notes, refer to:

*   [`PRD.md`](PRD.md) - Product Requirements Document and task breakdown.
*   [`retrospective.md`](retrospective.md) - Development retrospective and future enhancement ideas.
*   [`GEMINI.md`](GEMINI.md) - AI agent context and project overview.
