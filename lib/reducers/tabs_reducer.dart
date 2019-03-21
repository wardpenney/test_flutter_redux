import 'package:redux/redux.dart';
import 'package:test_flutter_redux/actions/actions.dart';
import 'package:test_flutter_redux/models/models.dart';

final tabsReducer = combineReducers<AppTab>([
  TypedReducer<AppTab, UpdateTabAction>(_activeTabReducer),
]);

AppTab _activeTabReducer(AppTab activeTab, UpdateTabAction action) {
  return action.newTab;
}