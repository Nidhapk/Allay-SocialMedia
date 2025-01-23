import 'package:flutter/widgets.dart';
import 'package:socialmediaapp/views/profile/widgets/sizedbox20.dart';
import 'package:socialmediaapp/views/profile/widgets/sizedbox50.dart';
import 'package:socialmediaapp/views/user_auth/widget/auth_textform.dart';
import 'package:socialmediaapp/views/user_auth/widget/fixedgradientbutton.dart';

Widget signUpForm(
    {required BuildContext context,
    required TextEditingController usernameController,
    required TextEditingController passwordController,
    required TextEditingController confirmPasswordController,
    required TextEditingController emailController,required void Function()? onPressed,required Widget child}) {
  final width = MediaQuery.of(context).size.width;
  return Padding(
    padding: EdgeInsets.all(width * 0.06),
    child: Column(
      children: [
        sizedbx50(context: context),
        authTextForm(
            context: context,
            controller: usernameController,
            labelText: 'Username'),
        sizedbox20(context: context),
        authTextForm(
          context: context,
          controller: emailController,
          labelText: 'Email',
        ),
        sizedbox20(context: context),
        authTextForm(
          context: context,
          controller: passwordController,
          labelText: 'Email',
        ),
        sizedbox20(context: context),
        authTextForm(
          context: context,
          controller: confirmPasswordController,
          labelText: 'Email',
        ),
        sizedbox20(context: context),
        fixedLenghtButton(
          context: context,
          onPressed: onPressed,
          child: child,
        )
      ],
    ),
  );
}
