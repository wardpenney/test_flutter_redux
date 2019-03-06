import 'package:redux/redux.dart';
import 'package:test_flutter_redux/actions/actions.dart';

final counterReducer = combineReducers<int>([
  TypedReducer<int, IncrementCountAction>(_incrementCounterReducer),
]);

int _incrementCounterReducer(int counter, IncrementCountAction action) {
  return counter + 1;
}
