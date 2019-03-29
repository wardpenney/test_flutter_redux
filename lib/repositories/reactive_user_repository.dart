import 'dart:async';

import 'package:test_flutter_redux/repositories/user_entity.dart';

abstract class ReactiveUserRepository {
  Future<UserEntity> login();
}
