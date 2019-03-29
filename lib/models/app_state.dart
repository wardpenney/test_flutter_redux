import 'package:meta/meta.dart';
import 'package:test_flutter_redux/models/models.dart';

@immutable
class AppState {
  final List<Score> scores;

  AppState({
    this.scores,
  });

	AppState copyWith({
    List<Score> scores,
  }) {
		return new AppState(
      scores: scores ?? this.scores,
		);
	}

  @override
  int get hashCode => scores.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          scores == other.scores;

  factory AppState.initial() => AppState(
    scores: [],
  );

  @override
  String toString() {
    return 'AppState{scores: $scores}';
  }
}
