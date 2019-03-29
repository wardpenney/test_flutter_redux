import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:test_flutter_redux/containers/scores_list_container.dart';
import 'package:test_flutter_redux/keys/keys.dart';
import 'package:test_flutter_redux/actions/actions.dart';
import 'package:test_flutter_redux/models/models.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen() : super(key: KeysScreens.homeScreen);

  @override 
  HomeScreenState createState() {
    return new HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Score"),
          ),
          body: ScoresListContainer(scores: vm.scores),
          floatingActionButton: FloatingActionButton(
            key: KeysButtons.addScore,
            onPressed: () {
              StoreProvider.of<AppState>(context).dispatch(AddScoreAction(new Score(1)));
            },
            child: Icon(Icons.arrow_upward),
          ),
        );
      },
    );
  }
}
class _ViewModel {
  final List<Score> scores;

  _ViewModel({
    @required this.scores,
  });
  
  static _ViewModel fromStore(Store<AppState> store) {
    return new _ViewModel(
      scores: store.state.scores,
    );
  }
}