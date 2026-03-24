# Restroom Rate Project: Retrospective Report

**Date:** March 24, 2026
**Project:** Restroom Rating Kiosk App (MVP)
**Platform:** Android (Flutter)

## Executive Summary
The Restroom Rate MVP was successfully rapidly developed and deployed to the Android emulator. All four phases outlined in the initial Product Requirements Document (PRD) were completed. The application successfully provides a streamlined, kiosk-optimized user experience for collecting restroom feedback and synchronizing it with Firebase Firestore.

## What Went Well
*   **Rapid UI Implementation:** Leveraging standard Flutter Material widgets alongside `go_router` allowed for swift implementation of a clean, responsive navigation flow between the Rating and Thank You screens.
*   **Kiosk Optimization:** Implementing kiosk-specific features was seamless. `wakelock_plus` successfully prevents screen sleeping, and Flutter's `SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky)` provides a flawless full-screen experience hiding the Android navigation bar and status bar.
*   **Offline-First Architecture:** By explicitly enabling Firestore's offline persistence, the application is inherently resilient to the spotty Wi-Fi connections often found in concrete restroom environments. Ratings are queued locally and synchronized automatically when the connection is restored.
*   **Fire-and-Forget Logic:** Designing the rating submission to be asynchronous ensures the UI never blocks. The user taps an emoji and is instantly navigated to the "Thank You" screen, ensuring high throughput for the kiosk.

## Challenges Encountered
*   **Tooling Hiccup during Launch:** When attempting to launch the application using the integrated Dart Tooling Daemon (`launch_app`), a minor pathing/directory configuration issue occurred on the host machine. 
    *   *Resolution:* Successfully gracefully degraded to using standard shell background processes (`flutter run -d emulator-5554`) to compile and run the application without blocking development.

## Technical Achievements
*   Upgraded Android `minSdkVersion` to 21 to support modern Firebase architectures.
*   Centralized theme and typography management utilizing `google_fonts` (Inter) for maximum readability.
*   State-independent auto-redirection using `Timer` in the `ThankYouScreen` lifecycle.

## Next Steps & Future Enhancements
While the MVP is fully functional, the following items are recommended for the next iteration based on the PRD and standard kiosk deployment practices:

1.  **Dynamic Room Configuration (Phase 3.4 follow-up):** The `roomId` is currently hardcoded (`restroom_main_01`). A hidden settings screen (accessed via a long-press gesture or specific tap pattern) should be added to allow administrators to configure the `roomId` via local storage (`shared_preferences`) upon deployment.
2.  **MDM & Device Pinning:** While immersive mode hides the UI, users can still theoretically swipe up to exit. The physical devices must be provisioned using an MDM (Mobile Device Management) solution or Android's built-in "App Pinning" to truly lock the application to the screen.
3.  **Analytics Dashboard:** Develop a companion web dashboard (potentially using Flutter Web or Firebase Extensions) to aggregate the Firestore data, calculating average scores per `roomId` over time to provide actionable maintenance insights.
4.  **Idle Animation / Screensaver:** If a user walks away on the "Thank You" screen, the 3-second timer resets it. However, adding a subtle pulsing animation to the emojis on the Rating Screen could help draw attention to the kiosk when idle.