import 'package:flutter/widgets.dart';
import 'package:socialmediaapp/core/constants/app_textstyles.dart';
import 'package:socialmediaapp/views/home/widgets/sizedbox30.dart';
import 'package:socialmediaapp/views/splashscreen/widget/linear_progressindicator.dart';

Widget loadingContent({required BuildContext context}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Allay',
          style: AppTextStyles().appNameStyle,
        ),
        sizedbox30(context: context),
        linearProgressIndicator(
          context: context,
        )
      ],
    ),
  );
}
