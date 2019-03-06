import 'package:meta/meta.dart';

@immutable
class AppState {
  final int counter;

  AppState({
    this.counter,
  });

	AppState copyWith({
    int counter,
  }) {
		return new AppState(
			counter: counter ?? this.counter,
		);
	}

  factory AppState.initial() => AppState(
    counter: 69
  );
}
