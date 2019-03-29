import 'package:redux/redux.dart';
import 'package:test_flutter_redux/actions/actions.dart';
import 'package:test_flutter_redux/models/models.dart';

final scoresReducer = combineReducers<List<Score>>([
  TypedReducer<List<Score>, LoadScoresAction>(_loadScores),
]);

List<Score> _loadScores(List<Score> scores, LoadScoresAction action) {
  return action.scores;
}
