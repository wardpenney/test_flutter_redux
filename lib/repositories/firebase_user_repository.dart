import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_flutter_redux/repositories/user_entity.dart';
import 'package:test_flutter_redux/repositories/reactive_user_repository.dart';

class FirebaseUserRepository implements ReactiveUserRepository {
  final FirebaseAuth auth;

  const FirebaseUserRepository(this.auth);

  @override
  Future<UserEntity> login() async {
    final firebaseUser = await auth.signInAnonymously();

    return UserEntity(
      id: firebaseUser.uid,
    );
  }
}
