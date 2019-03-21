import 'package:test_flutter_redux/models/models.dart';

class DecrementCountAction {}
class IncrementCountAction {}
class SetupCounterAction {}

class UpdateTabAction {
  final AppTab newTab;

  UpdateTabAction(this.newTab);

  @override
  String toString() {
    return 'UpdateTabAction{newTab: $newTab}';
  }
}