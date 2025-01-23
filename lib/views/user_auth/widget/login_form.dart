import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:socialmediaapp/core/constants/app_textstyles.dart';
import 'package:socialmediaapp/views/profile/widgets/sizedbox10.dart';
import 'package:socialmediaapp/views/profile/widgets/sizedbox20.dart';
import 'package:socialmediaapp/views/profile/widgets/sizedbox50.dart';
import 'package:socialmediaapp/views/user_auth/widget/auth_textform.dart';
import 'package:socialmediaapp/views/user_auth/widget/fixedgradientbutton.dart';
import 'package:socialmediaapp/views/user_auth/widget/forgetpass_button.dart';

Widget loginForm(
    {required BuildContext context,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    String? Function(String?)? emailValidator,
    String? Function(String?)? passwordValidator,
    required void Function()?  loginOnTap,
    required void Function()? forgetPasswordOnTap,
    required Key? formKey,required Widget child}) {
  final width = MediaQuery.of(context).size.width;
 return  Padding(
    padding: EdgeInsets.all(width * 0.06),
    child: Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Allay',
            style: AppTextStyles().appNameStyle,
          ),
          sizedbx50(
            context: context,
          ),
          authTextForm(
            context: context,
            controller: emailController,
            validator: emailValidator,
            labelText: 'username or emailid',
          ), //username/emailid field
          sizedbox20(
            context: context,
          ),
          authTextForm(
            context: context,
            controller: passwordController,
            validator: passwordValidator,
            labelText: 'password',
          ), //password field
          sizedBox10(
            context: context,
          ),
          forgetPasswordButton(
            context: context,
            onTap: forgetPasswordOnTap,
          ), //Forget password button
          sizedbx50(
            context: context,
          ),
          fixedLenghtButton(child: child,
            context: context,
            
            onPressed: loginOnTap,
          ) // Sign In Button
        ],
      ),
    ),
  );
}
