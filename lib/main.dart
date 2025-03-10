import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/routes/routes.export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
