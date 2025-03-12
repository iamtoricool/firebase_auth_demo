import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/models.export.dart';

export '../../models/models.export.dart' show UserModel;

class UserRepo extends StateNotifier<UserModel?> {
  UserRepo() : super(null);

  bool get isLoggedIn => state != null;

  Future<MapEntry<String?, UserModel?>> signIn() async {
    await Future.delayed(Duration(seconds: 2));
    print('Signed In!');

    final user = UserModel.mock().copyWith(lastLoggedIn: DateTime.now());
    state = user;

    return MapEntry(null, user);
  }
}

final userRepoProvider = StateNotifierProvider<UserRepo, UserModel?>(
  (ref) => UserRepo(),
);
