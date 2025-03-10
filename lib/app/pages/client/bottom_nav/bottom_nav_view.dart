import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/repositories/repositories.export.dart';

@RoutePage()
class BottomNavView extends ConsumerWidget {
  const BottomNavView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userRepoProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('User Home')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text('Full Name: ${user.user?.fullName ?? ''}'),
            Text('Full Name: ${user.user?.fullName ?? ''}'),
          ],
        ),
      ),
    );
  }
}
