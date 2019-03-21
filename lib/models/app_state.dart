import 'package:meta/meta.dart';
import 'package:test_flutter_redux/models/models.dart';

@immutable
class AppState {
  final int counter;
  final AppTab activeTab;

  AppState({
    this.counter,
    this.activeTab = AppTab.inrement,
  });

	AppState copyWith({
    AppTab activeTab,
    int counter,
  }) {
		return new AppState(
      activeTab: activeTab ?? this.activeTab,
			counter: counter ?? this.counter,
		);
	}

  @override
  int get hashCode =>
      counter.hashCode ^
      activeTab.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          counter == other.counter &&
          activeTab == other.activeTab;

  factory AppState.initial() => AppState(
    counter: 69
  );

  @override
  String toString() {
    return 'AppState{counter: $counter, activeTab: $activeTab}';
  }
}
