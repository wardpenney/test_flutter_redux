import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_redux/models/score.dart';

class ScoresListContainer extends StatelessWidget {
  final List<Score> scores;

  ScoresListContainer({
    @required this.scores,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: scores.length,
      itemBuilder: (BuildContext context, int index) {
        final score = scores[index];

        return Text(
          score.value.toString(),
          style: Theme.of(context).textTheme.display1,
        );
      },
    );
  }
}
