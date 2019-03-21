import 'package:test_flutter_redux/models/models.dart';
import 'package:test_flutter_redux/reducers/counter_reducer.dart';
import 'package:test_flutter_redux/reducers/tabs_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    counter: counterReducer(state.counter, action),
    activeTab: tabsReducer(state.activeTab, action),
  );
}
