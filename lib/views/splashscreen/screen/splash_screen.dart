import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socialmediaapp/viewmodels/spalsh_viewmodel.dart';


class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: spalshViewModel(
        context: context,
        ref: ref,
      ),
    );
  }
}