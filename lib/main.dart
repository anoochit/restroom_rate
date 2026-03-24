import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import 'screens/rating_screen.dart';
import 'screens/thank_you_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Task 4.1: Keep the screen awake indefinitely
  WakelockPlus.enable();

  // Task 4.2: Hide system navigation and status bars for kiosk mode
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  // Task 4.3: Ensure Firestore offline persistence is explicitly enabled
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );

  runApp(const RestroomRateApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const RatingScreen();
      },
    ),
    GoRoute(
      path: '/thank-you',
      builder: (BuildContext context, GoRouterState state) {
        return const ThankYouScreen();
      },
    ),
  ],
);

class RestroomRateApp extends StatelessWidget {
  const RestroomRateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Restroom Rate Kiosk',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
          surface: Colors.grey[50],
        ),
        textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
