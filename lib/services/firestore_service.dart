import 'dart:developer' as developer;
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Task 3.4: Hardcoded Room ID for MVP. Can be made configurable later.
  static const String defaultRoomId = 'restroom_main_01';

  /// Task 3.2: Submit rating to Firestore.
  /// Uses a fire-and-forget approach or can be awaited.
  Future<void> submitRating(int score, {String roomId = defaultRoomId}) async {
    try {
      final data = {
        'score': score,
        'roomId': roomId,
        'timestamp': FieldValue.serverTimestamp(),
      };

      await _db.collection('rooms').doc(roomId).collection('ratings').add(data);

      developer.log(
        'Successfully submitted rating: $score for room: $roomId',
        name: 'FirestoreService',
      );
    } catch (e, stackTrace) {
      developer.log(
        'Failed to submit rating',
        name: 'FirestoreService',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }
}
