import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:test_flutter_redux/reducers/app_state_reducer.dart';
import 'package:test_flutter_redux/models/models.dart';
import 'package:test_flutter_redux/presentation/home_screen.dart';
import 'package:test_flutter_redux/keys/keys.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [],
  );

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