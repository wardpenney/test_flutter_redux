import 'package:test_flutter_redux/actions/actions.dart';
import 'package:test_flutter_redux/models/models.dart';
import 'package:test_flutter_redux/repositories/reactive_scores_repository.dart';
import 'package:test_flutter_redux/repositories/reactive_user_repository.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createScoresMiddleware(
  ReactiveScoresRepository scoresRepository,
  ReactiveUserRepository userRepository,
) {
  return [
    TypedMiddleware<AppState, InitAppAction>(
      _firestoreSignIn(userRepository),
    ),
    TypedMiddleware<AppState, ConnectToDataSourceAction>(
      _firestoreConnect(scoresRepository),
    ),
    TypedMiddleware<AppState, AddScoreAction>(
      _firestoreSaveNewScore(scoresRepository),
    ),
    TypedMiddleware<AppState, AddScoreAction>(
      _firestoreSaveNewScore(scoresRepository),
    ),
  ];
}

void Function(
  Store<AppState> store,
  InitAppAction action,
  NextDispatcher next,
) _firestoreSignIn(
  ReactiveUserRepository userRepository,
) {
  return (store, action, next) {
    next(action);

    userRepository.login().then((_) {
      store.dispatch(ConnectToDataSourceAction());
    });
  };
}

void Function(
  Store<AppState> store,
  ConnectToDataSourceAction action,
  NextDispatcher next,
) _firestoreConnect(
  ReactiveScoresRepository scoresRepository,
) {
  return (store, action, next) {
    next(action);

    scoresRepository.scores().listen((scores) {
      store.dispatch(LoadScoresAction(scores.map(Score.fromEntity).toList()));
    });
  };
}

void Function(
  Store<AppState> store,
  AddScoreAction action,
  NextDispatcher next,
) _firestoreSaveNewScore(
  ReactiveScoresRepository repository,
) {
  return (store, action, next) {
    next(action);
    repository.addNewScore(action.score.toEntity());
  };
}
