import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socialmediaapp/viewmodels/signup_viewmodel.dart';

import 'package:socialmediaapp/views/user_auth/widget/auth_prompt.dart';

class SignUpScreen extends ConsumerWidget {
  SignUpScreen({super.key});
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return Scaffold(
      body: signUpViewModel(ref: ref,
        context: context,
        usernameController: usernameController,
        emailController: emailController,
        passwordController: passwordController,
        confirmPasswordController: confirmPasswordController,
      ),
      bottomNavigationBar: authPrompt(
          context: context,
          onTap: () {
            Navigator.pop(context);
          },
          promptText: 'Already have an account? ',
          actionText: 'Sign In'),
    );
  }
}
