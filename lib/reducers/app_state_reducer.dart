import 'package:test_flutter_redux/models/models.dart';
import 'package:test_flutter_redux/reducers/scores_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    scores: scoresReducer(state.scores, action),
  );
}
