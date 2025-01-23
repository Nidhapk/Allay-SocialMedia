import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socialmediaapp/viewmodels/login_viewmodel.dart';
import 'package:socialmediaapp/views/user_auth/widget/auth_prompt.dart';


class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(

       // The main body of the login screen,
      body: loginViewModel(
        context: context,// Passing the context to the ViewModel
        formKey: _formKey, // FormKey for form validation
        emailController: emailController,// Controller for email input
        passwordController: passwordController, // Controller for password input
        ref: ref, // WidgetRef to interact with providers
      ),

       // Bottom navigation bar providing a prompt to navigate to the Sign-Up screen
      bottomNavigationBar: authPrompt(
        context: context,
        promptText: 'Dont\'t have an account?  ',
        actionText: 'Sign Up',
        onTap: () {
          Navigator.pushNamed(
            context,
            '/SigUpScreen',
          ); // Navigate to the Sign-Up screen when tapped
        },
      ),
    );
  }
}
