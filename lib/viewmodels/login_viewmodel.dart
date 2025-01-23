import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socialmediaapp/controllers/providers/login_provider.dart';
import 'package:socialmediaapp/core/utils/validation_utils.dart';
import 'package:socialmediaapp/views/user_auth/widget/custom_progressindicator.dart';
import 'package:socialmediaapp/views/user_auth/widget/login_form.dart';

loginViewModel({
  required BuildContext context,
  required Key? formKey,
  required TextEditingController emailController,
  required TextEditingController passwordController,
  required WidgetRef ref,
}) {
  final loginState = ref.watch(loginProvider); // Observe state
  final loginNotifier = ref.read(loginProvider.notifier); // Access notifier
  if (loginState.isSuccess) {
    Future.microtask(
      () {
        Navigator.pushReplacementNamed(context, '/SplashScreen');
        loginNotifier.resetState(); // Reset state to avoid duplicate navigation
      },
    );
  }

  return loginForm(
    context: context,
    emailController: emailController,
    passwordController: passwordController,
    emailValidator: (value) => validateEmail(value),
    passwordValidator: (value) => validatePassword(value),
    loginOnTap: () {
      
      // Trigger login and get the AsyncValue from the loginProvider
      loginNotifier.login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
    },
    child: loginState.isLoading
        ? 
       customProgressIndicator() : const Text(
            'Sign In',
          ),
    forgetPasswordOnTap: () {},
    formKey: formKey,
  );
}
