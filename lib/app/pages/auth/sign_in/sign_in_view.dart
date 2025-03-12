import 'package:async/async.dart';
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
        onPressed: () async {
          await Future.delayed(
            Durations.extralong4,
            () => ref.read(userRepoProvider.notifier).signIn(),
          );
          context.router.replacePath('/client');
        },
      ),
    );
  }
}

Future<T?> showAsyncOverlay<T>(
  BuildContext context, {
  required Future<T> Function() asyncFunction,
}) async {
  final cancelableOperation = CancelableOperation<T>.fromFuture(
    asyncFunction(),
  );

  return await showDialog<T>(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) {
      cancelableOperation.then(
        (value) => Navigator.of(dialogContext).pop(value),
        onCancel: () => Navigator.of(dialogContext).pop(),
      );
      return PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (!cancelableOperation.isCanceled) {
            cancelableOperation.cancel();
            Navigator.of(dialogContext).pop();
          }
        },
        child: Center(child: CircularProgressIndicator()),
      );
    },
  ).then((value) {
    if (cancelableOperation.isCanceled) return null;
    return value;
  });
}
