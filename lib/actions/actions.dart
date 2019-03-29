import 'package:test_flutter_redux/models/models.dart';

class SetupCounterAction {}

class InitAppAction {
  @override
  String toString() {
    return 'InitAppAction{}';
  }
}

class ConnectToDataSourceAction {
  @override
  String toString() {
    return 'ConnectToDataSourceAction{}';
  }
}

class LoadScoresAction {
  final List<Score> scores;

  LoadScoresAction(this.scores);

  @override
  String toString() {
    return 'LoadScoresAction{scores: $scores}';
  }
}

class AddScoreAction {
  final Score score;

  AddScoreAction(this.score);

  @override
  String toString() {
    return 'AddScoreAction{score: $score}';
  }
}