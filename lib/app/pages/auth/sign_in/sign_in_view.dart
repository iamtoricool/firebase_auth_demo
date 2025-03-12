import 'package:auto_route/auto_route.dart';
import 'package:fdevs_fitkit/fdevs_fitkit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/repositories/repositories.export.dart';

@RoutePage()
class SignInView extends ConsumerWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(signInViewNotifier);
    return Form(
      child: Builder(
        builder: (formContext) {
          return Scaffold(
            appBar: AppBar(title: Text('Sign In')),
            body: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email khan',
                        hintText: 'Mara khan',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please mara khan';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: controller.passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        labelText: 'Password khan',
                        hintText: 'Mara khan',
                      ),

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please ektu mara khan';
                        }
                        return null;
                      },
                    ),

                    const SizedBox.square(dimension: 24),

                    InkWell(
                      onTap: () => context.router.pushPath('/auth/sign-up'),
                      child: Text('Sign Up'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (Form.maybeOf(formContext)?.validate() == true) {
                          return await _handleFormSubmit(context, ref);
                        }
                      },
                      child: Text('Sign In'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _handleFormSubmit(BuildContext ctx, WidgetRef ref) async {
    final _result = await showAsyncLoadingOverlay(
      ctx,
      asyncFunction: ref.read(signInViewNotifier).handleSignIn,
      loadingWidget: Center(child: CircularProgressIndicator()),
    );

    if (ctx.mounted) {
      if (_result.key != null) {
        showCustomSnackBar(
          ctx,
          content: Text(_result.key!),
          customSnackBarType: CustomOverlayType.error,
        );
        return;
      }

      return ctx.router.replacePath<void>('/client');
    }
  }
}

class SignInViewProvider extends ChangeNotifier {
  SignInViewProvider(this.ref) : _repo = ref.read(userRepoProvider.notifier);

  final Ref ref;
  final UserRepo _repo;

  late final emailController = TextEditingController();
  late final passwordController = TextEditingController();

  Future<MapEntry<String?, User?>> handleSignIn() async {
    return await _repo.signIn(
      email: emailController.text,
      password: passwordController.text,
    );
  }
}

final signInViewNotifier = ChangeNotifierProvider.autoDispose(
  (ref) => SignInViewProvider(ref),
);
