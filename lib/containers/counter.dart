import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:test_flutter_redux/models/app_state.dart';

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint("WARDTEST Containers Counter build");

    return new StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _ViewModel viewModel) {
        return new Text(
          viewModel.counterValue.toString(),
          style: Theme.of(context).textTheme.display1,
        );
      }
    );
  }
}

class _ViewModel {
  final int counterValue;

  _ViewModel({
    @required this.counterValue,
  });
  
  static _ViewModel fromStore(Store<AppState> store) {
    return new _ViewModel(counterValue: store.state.counter);
  }
}