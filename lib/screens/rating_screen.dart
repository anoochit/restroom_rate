import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../services/firestore_service.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'How was your restroom experience today?',
                style: Theme.of(context).textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildEmojiButton(context, '😠', 1, 'Terrible'),
                  _buildEmojiButton(context, '😟', 2, 'Bad'),
                  _buildEmojiButton(context, '😐', 3, 'Okay'),
                  _buildEmojiButton(context, '🙂', 4, 'Good'),
                  _buildEmojiButton(context, '😁', 5, 'Excellent'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmojiButton(
    BuildContext context,
    String emoji,
    int score,
    String label,
  ) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // Task 3.3: Submit rating to Firestore (Fire and forget, so it doesn't block UI)
          _firestoreService.submitRating(score);
          context.go('/thank-you');
        },
        borderRadius: BorderRadius.circular(24),
        hoverColor: Colors.blue.withValues(alpha: 0.1),
        splashColor: Colors.blue.withValues(alpha: 0.2),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(emoji, style: const TextStyle(fontSize: 100)),
              const SizedBox(height: 16),
              Text(
                label,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.blueGrey[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
