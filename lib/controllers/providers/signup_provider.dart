import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:socialmediaapp/controllers/providers/login_provider.dart';
import 'package:socialmediaapp/core/services/auth_services.dart';
import 'package:socialmediaapp/core/services/grapql_config/user_profile_mutations.dart';
import 'package:socialmediaapp/viewmodels/states/login_state.dart';

class SignUpNotifier extends StateNotifier<LoginState> {
  final AuthServices authService;

  SignUpNotifier(this.authService) : super(LoginState.initial());

  Future<void> signUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
      isSuccess: false,
    );

    try {
      // Firebase Authentication
      final firebaseUid = await authService.signUp(email, password);

      // GraphQL Mutation
      final client = GraphQLProvider.of(context).value;
      final mutationOptions = MutationOptions(
        document: addUserProfileMutation,
        variables: {
          'email_id': email,
          'firebase_uid': firebaseUid?.uid,
          'user_name': email.split('@').first,
          'password':password
        },
      );

      final result = await client.mutate(mutationOptions);

      if (result.hasException) {
        log('${result.exception}');
        throw Exception(result.exception.toString());
      }

      state = state.copyWith(
        isLoading: false,
        isSuccess: true,
        errorMessage: null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  void resetState() {
    state = LoginState.initial();
  }
}

final signUpProvider = StateNotifierProvider<SignUpNotifier, LoginState>(
  (ref) {
    final authService =
        ref.watch(authServiceProvider); // Your AuthServices provider
    return SignUpNotifier(authService);
  },
);
