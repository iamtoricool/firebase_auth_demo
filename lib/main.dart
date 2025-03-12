import 'package:firebase_auth_demo/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/routes/routes.export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.microtask(
    () =>
        Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
  );

  final _router = AppRouter();
  runApp(ProviderScope(overrides: [], child: MainApp(router: _router)));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.router});
  final AppRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router.config());
  }
}
