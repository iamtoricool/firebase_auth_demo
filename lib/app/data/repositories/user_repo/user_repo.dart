import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

export 'package:firebase_auth/firebase_auth.dart' show User;

class UserRepo extends AsyncNotifier<User?> {
  @override
  FutureOr<User?> build() async {
    return await getUser();
  }

  bool get isLoggedIn => state.value != null;
  Future<User?> getUser() async {
    return FirebaseAuth.instance.currentUser;
  }

  Future<MapEntry<String?, User?>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final _result = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      state = AsyncValue.data(_result.user);
      return MapEntry(null, state.value);
    } catch (e) {
      return MapEntry(e.toString(), null);
    }
  }
}

final userRepoProvider = AsyncNotifierProvider<UserRepo, User?>(
  () => UserRepo(),
);
