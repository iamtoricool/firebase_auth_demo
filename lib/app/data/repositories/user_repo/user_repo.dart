import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/models.export.dart';

export '../../models/models.export.dart' show UserModel;

class UserRepo {
  UserModel? user;
  bool get isLoggedIn => user != null;

  Future<MapEntry<String?, UserModel?>> signIn() async {
    await Future.delayed(Duration(seconds: 2));

    return MapEntry(
      null,
      UserModel.mock().copyWith(lastLoggedIn: DateTime.now()),
    );
  }
}

final userRepoProvider = Provider.autoDispose<UserRepo>((ref) => UserRepo());
