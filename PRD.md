# Product Requirements Document (PRD): Restroom Rating Kiosk App

## 1. Overview
A Flutter-based Android application designed to run on a kiosk device placed inside restrooms. The app allows users to quickly rate the cleanliness and experience of the restroom using a 5-point emoji scale. Ratings are stored in Firebase Firestore for real-time monitoring and analytics.

## 2. Target Platform
*   **OS:** Android (Optimized for tablets/kiosk devices).
*   **Framework:** Flutter.

## 3. Core Features
### 3.1. Rating Screen
*   The default home screen of the application.
*   Displays a clear, prominent prompt (e.g., "How was your restroom experience today?").
*   Displays 5 interactive emoji buttons representing a scale from 1 (Terrible) to 5 (Excellent).
*   Tapping an emoji instantly submits the rating to the database and navigates to the Thank You Screen.

### 3.2. Thank You Screen
*   Displays a brief gratitude message (e.g., "Thank you for your feedback!").
*   Automatically redirects back to the Rating Screen after a short delay (e.g., 3-5 seconds) so the kiosk is immediately ready for the next user.

### 3.3. Data Storage (Firebase Firestore)
*   **Database:** Firebase Cloud Firestore.
*   **Path:** `rooms/{roomId}/ratings/{documentId}`
*   **Data Payload:**
    ```json
    {
      "timestamp": "<Firestore Timestamp>",
      "score": "<Integer 1-5>",
      "roomId": "<String>"
    }
    ```

### 3.4. Kiosk Mode Requirements
*   The app should run in full-screen (immersive) mode, hiding system navigation and status bars.
*   The screen must not turn off or sleep while the app is running.
*   *Note on OS Locking:* Pinning the app to the screen (locking out of other Android features) should be handled via Android's built-in "App Pinning" or an MDM solution.

---

## 4. Task Breakdown

### Phase 1: Project & Firebase Setup
- [ ] **Task 1.1:** Create a Firebase project in the Firebase Console and enable Cloud Firestore.
- [ ] **Task 1.2:** Register the Android app in Firebase, download `google-services.json`, and place it in the `android/app` directory.
- [ ] **Task 1.3:** Add Firebase SDK dependencies to `pubspec.yaml` (`firebase_core`, `cloud_firestore`).
- [ ] **Task 1.4:** Initialize Firebase in `main.dart` (`Firebase.initializeApp()`).
- [ ] **Task 1.5:** Configure Android build settings (update `minSdkVersion` if required by Firebase).

### Phase 2: UI Development
- [ ] **Task 2.1:** Add necessary UI dependencies to `pubspec.yaml` (e.g., custom fonts, SVG/Lottie for emojis if needed).
- [ ] **Task 2.2:** Build the `RatingScreen` UI. Create a responsive layout with 5 distinct emoji buttons.
- [ ] **Task 2.3:** Build the `ThankYouScreen` UI with a simple, centralized message.
- [ ] **Task 2.4:** Implement navigation between the screens using Flutter's `Navigator` or `go_router`.
- [ ] **Task 2.5:** Implement an auto-redirect timer (e.g., 3 seconds) using `Future.delayed` or a `Timer` on the `ThankYouScreen`.

### Phase 3: Firebase Integration & Logic
- [ ] **Task 3.1:** Create a `FirestoreService` (or repository) class to encapsulate database operations.
- [ ] **Task 3.2:** Implement the `submitRating(int score)` function to write the data map to the `rooms/{roomId}/ratings/` collection using a server timestamp.
- [ ] **Task 3.3:** Connect the emoji tap events on the `RatingScreen` to the `submitRating` function, handling loading states if necessary.
- [ ] **Task 3.4:** Add a mechanism to define the `roomId`. (For MVP, this can be hardcoded as a constant; later, it can be configurable via settings or local storage).

### Phase 4: Kiosk Optimization & Polish
- [ ] **Task 4.1:** Add the `wakelock_plus` dependency and initialize it to keep the screen awake indefinitely.
- [ ] **Task 4.2:** Configure Android immersive mode using `SystemChrome.setEnabledSystemUIMode` to hide system UI.
- [ ] **Task 4.3:** Ensure Firestore offline persistence is enabled (default behavior) so ratings aren't lost if the kiosk temporarily loses its Wi-Fi connection.
- [ ] **Task 4.4:** Perform end-to-end testing on an Android device or emulator to verify flow and database writes.
