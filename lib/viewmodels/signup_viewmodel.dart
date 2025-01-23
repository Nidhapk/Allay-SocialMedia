import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socialmediaapp/controllers/providers/signup_provider.dart';
import 'package:socialmediaapp/views/user_auth/widget/custom_progressindicator.dart';
import 'package:socialmediaapp/views/user_auth/widget/signup_form.dart';

Widget signUpViewModel(
    {required BuildContext context,
    required TextEditingController usernameController,
    required TextEditingController passwordController,
    required TextEditingController confirmPasswordController,
    required TextEditingController emailController,
    required WidgetRef ref}) {
  final signupState = ref.watch(signUpProvider);
  final signUpNotifier = ref.read(signUpProvider.notifier);
  if (signupState.isSuccess) {
    Future.microtask(
      () {
        Navigator.pushReplacementNamed(context, '/SplashScreen');
        signUpNotifier
            .resetState(); // Reset state to avoid duplicate navigation
      },
    );
  }
  return signUpForm(
    context: context,
    usernameController: usernameController,
    passwordController: passwordController,
    confirmPasswordController: confirmPasswordController,
    emailController: emailController,
    onPressed: () {
      signUpNotifier.signUp(context: context,
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    },
    child: signupState.isLoading
        ? customProgressIndicator()
        : const Text('Sign Up'),
  );
}
