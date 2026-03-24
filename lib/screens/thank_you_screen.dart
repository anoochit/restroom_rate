import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ThankYouScreen extends StatefulWidget {
  const ThankYouScreen({super.key});

  @override
  State<ThankYouScreen> createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Redirect back to the rating screen after 3 seconds
    _timer = Timer(const Duration(seconds: 3), () {
      if (mounted) {
        context.go('/');
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('🙏', style: TextStyle(fontSize: 120)),
            const SizedBox(height: 32),
            Text(
              'Thank you for your feedback!',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[900],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Have a wonderful day.',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(color: Colors.blueGrey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
