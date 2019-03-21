import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:test_flutter_redux/containers/counter.dart';
import 'package:test_flutter_redux/containers/active_tab.dart';
import 'package:test_flutter_redux/containers/tab_selector.dart';
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
    return ActiveTab(
      builder: (BuildContext context, AppTab activeTab) {
        final floatingIcon = activeTab == AppTab.inrement
          ? Icons.arrow_upward
          : Icons.arrow_downward;
          
        return Scaffold(
          appBar: AppBar(
            title: Text("Score"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Score:',
                ),
                Counter(),
              ],
            ),
          ),
          bottomNavigationBar: TabSelector(),
          floatingActionButton: FloatingActionButton(
            key: KeysButtons.incrementCounter,
            onPressed: () {
              final floatingAction = activeTab == AppTab.inrement
                ? IncrementCountAction()
                : DecrementCountAction();
              StoreProvider.of<AppState>(context).dispatch(floatingAction);
            },
            child: Icon(floatingIcon),
          ),
        );
      }
    );
  }
}