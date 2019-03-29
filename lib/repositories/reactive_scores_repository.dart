import 'dart:async';
import 'dart:core';
import 'package:test_flutter_redux/repositories/score_entity.dart';

abstract class ReactiveScoresRepository {
  Future<void> addNewScore(ScoreEntity score);

  Stream<List<ScoreEntity>> scores();
}
