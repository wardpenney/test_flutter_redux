import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_flutter_redux/reducers/app_state_reducer.dart';
import 'package:test_flutter_redux/models/models.dart';
import 'package:test_flutter_redux/presentation/home_screen.dart';
import 'package:test_flutter_redux/keys/keys.dart';
import 'package:test_flutter_redux/actions/actions.dart';
import 'package:test_flutter_redux/middleware/scores_middleware.dart';
import 'package:test_flutter_redux/repositories/reactive_scores_repository.dart';
import 'package:test_flutter_redux/repositories/firestore_scores_repository.dart';
import 'package:test_flutter_redux/repositories/reactive_user_repository.dart';
import 'package:test_flutter_redux/repositories/firebase_user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  Firestore firestore = Firestore.instance;
  firestore.settings(timestampsInSnapshotsEnabled: true);

  runApp(MyApp(firestore));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp(
    Firestore firestore,
    {
      Key key,
      ReactiveScoresRepository scoresRepository,
      ReactiveUserRepository userRepository,
    }
  ) : store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: createScoresMiddleware(
      scoresRepository ?? FirestoreScoresRepository(firestore),
      userRepository ?? FirebaseUserRepository(FirebaseAuth.instance),
    ),
  ),
  
  super(key: key) {
    store.dispatch(InitAppAction());
  }
  
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        routes: {
          KeysRoutes.home: (context) {
            return HomeScreen();
          },
        },
      ),
    );
  }
}