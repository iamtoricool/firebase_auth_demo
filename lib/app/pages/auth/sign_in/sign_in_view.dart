import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/repositories/repositories.export.dart';

@RoutePage()
class SignInView extends ConsumerWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(child: Text('SignInView is working')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(userRepoProvider).isLoggedIn = true;
          context.router.replacePath('/client/bottom-nav');
        },
      ),
    );
  }
}
