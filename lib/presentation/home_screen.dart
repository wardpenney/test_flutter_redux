import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:test_flutter_redux/containers/counter.dart';
import 'package:test_flutter_redux/keys/keys.dart';
import 'package:test_flutter_redux/actions/actions.dart';
import 'package:test_flutter_redux/models/models.dart';

class HomeScreen extends StatefulWidget {
  final void Function() onInit;

  HomeScreen({
    @required this.onInit,
  }) : super(key: const Key('__homeScreen__'));

  @override
  HomeScreenState createState() {
    return new HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WARDTEST"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Counter(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: KeysButtons.incrementCounter,
        onPressed: () {
          StoreProvider.of<AppState>(context).dispatch(IncrementCountAction());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
