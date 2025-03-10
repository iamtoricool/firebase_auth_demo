import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserRepo {
  bool isLoggedIn = false;
}

final userRepoProvider = Provider.autoDispose<UserRepo>((ref) => UserRepo());
