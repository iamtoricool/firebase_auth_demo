import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

export 'user_repo/user_repo.dart';

final firebaseProvider = Provider.autoDispose<Firebase>(
  (ref) => throw UnimplementedError(),
);
