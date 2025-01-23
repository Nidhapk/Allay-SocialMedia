import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socialmediaapp/controllers/auth_provider.dart';
import 'package:socialmediaapp/viewmodels/states/auth_state.dart';
import 'package:socialmediaapp/views/splashscreen/widget/loadingscreen_content.dart';

Widget spalshViewModel({required BuildContext context,required WidgetRef ref}) {
final authStatus = ref.watch(authProvider);
   WidgetsBinding.instance.addPostFrameCallback((_) {
    if (authStatus == AuthStatus.authenticated) {
      Navigator.pushReplacementNamed(context, '/MainScreen');
    } else if (authStatus == AuthStatus.unauthenticated) {
      Navigator.pushReplacementNamed(context, '/LoginScreen');
    }
  });
  return loadingContent(context: context);
}
