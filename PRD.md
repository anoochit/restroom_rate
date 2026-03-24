# Product Requirements Document: Restroom Rate App

## Overview
A kiosk-style Android application designed to be placed on a dedicated device inside a restroom. It allows users to quickly rate their restroom experience. The app features two screens: a rating screen with a 5-emoji rating bar, and a temporary "Thank You" screen. Rating data is stored in a Firebase Firestore database.

## Target Platform
- **Android** (Dedicated device acting as a kiosk in the restroom)

## Pages

### 1. Rating Screen
- **Purpose:** The main, idle interface for users to submit their rating.
- **UI Elements:**
  - A prominent prompt (e.g., "Please rate your experience").
  - A row of 5 emoji smileys representing a scale from 1 to 5.
    - 1: 😠 (Very Bad)
    - 2: 🙁 (Bad)
    - 3: 😐 (Okay)
    - 4: 🙂 (Good)
    - 5: 😄 (Excellent)
- **Interaction:** Tapping an emoji immediately records the score, triggers the database save, and navigates to the Thank You Screen.

### 2. Thank You Screen
- **Purpose:** To acknowledge the user's feedback.
- **UI Elements:**
  - A large "Thank You!" message.
- **Interaction:** This screen is temporary. After a short delay (e.g., 3 seconds), it automatically transitions back to the Rating Screen, ready for the next user.

## Data Model (Firebase Firestore)
Each rating is stored as a distinct document using the timestamp as the document ID.

- **Collection Path:** `rooms/{roomId}/ratings/`
- **Document ID:** `{timestamp}` (e.g., ISO8601 string or Unix epoch)
- **Document Data Structure:**
  ```json
  {
    "timestamp": "<Timestamp>",
    "score": "<Integer 1-5>",
    "roomId": "<String (e.g., 'restroom_01')>"
  }
  ```

## Task Breakdown

### Phase 1: Project Setup and Firebase Integration
- [ ] Initialize the Flutter project.
- [ ] Create a Firebase project via the Firebase Console.
- [ ] Configure Firebase for the Android app (using `flutterfire configure`).
- [ ] Add necessary Flutter dependencies: `firebase_core`, `cloud_firestore`.
- [ ] Initialize Firebase in `main.dart`.
- [ ] Define the configuration strategy for `roomId` (e.g., hardcoded constant for the specific device, or a hidden settings menu).

### Phase 2: UI Implementation
- [ ] **Rating Screen (`lib/rating_screen.dart`):**
  - Scaffold the layout.
  - Create the 5 emoji buttons using `GestureDetector` or `InkWell` with large touch targets for easy tapping.
- [ ] **Thank You Screen (`lib/thank_you_screen.dart`):**
  - Scaffold a centered text layout.
  - Implement a `Future.delayed` to automatically navigate back to the Rating Screen after 3 seconds.
- [ ] **Kiosk Mode Configurations:**
  - Implement immersive fullscreen mode (hide system status bar and navigation bar).
  - Add dependency to keep the screen on (`wakelock_plus` or similar).

### Phase 3: Data Layer & Business Logic
- [ ] Create a model class for `Rating` to structure the data.
- [ ] Create a `FirebaseService` or `RatingRepository` to handle Firestore interactions.
  - Implement a method: `Future<void> submitRating(int score, String roomId)`.
  - Ensure the document ID is explicitly set to the generated timestamp per the requirements: `rooms/{roomId}/ratings/{timestamp}`.

### Phase 4: State Management & Navigation Integration
- [ ] Connect the `RatingScreen` emoji buttons to the `submitRating` logic.
- [ ] Implement the navigation flow:
  1. User taps an emoji.
  2. Call `submitRating()`.
  3. Navigate to `ThankYouScreen` (e.g., `Navigator.pushReplacement`).
  4. Delay 3 seconds.
  5. Navigate back to `RatingScreen`.

### Phase 5: Polish & Testing
- [ ] Add visual feedback (e.g., ripple effect) to the emoji buttons so users know their tap registered.
- [ ] Handle offline persistence (Firestore handles this out of the box, but ensure the UI doesn't block if the network drops).
- [ ] Test the infinite loop on an Android device/emulator to ensure stability over long periods.
- [ ] Verify that data appears correctly structured in the Firebase Console.
