import 'dart:async';
import 'package:test_flutter_redux/repositories/score_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_flutter_redux/repositories/reactive_scores_repository.dart';

class FirestoreScoresRepository implements ReactiveScoresRepository {
  static const String scoreCollection = 'scores';

  final Firestore firestore;

  const FirestoreScoresRepository(this.firestore);

  @override
  Future<void> addNewScore(ScoreEntity score) {
    return firestore.collection(scoreCollection).document(score.id).setData(score.toJson());
  }

  @override
  Stream<List<ScoreEntity>> scores() {
    return firestore.collection(scoreCollection).snapshots().map((snapshot) {
      return snapshot.documents.map((doc) {
        return ScoreEntity(
          doc['value'],
          doc.documentID,
        );
      }).toList();
    });
  }
}
