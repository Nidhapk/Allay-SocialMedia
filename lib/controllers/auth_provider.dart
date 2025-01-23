import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socialmediaapp/viewmodels/states/auth_state.dart';

class AuthNotifier extends StateNotifier<AuthStatus> {
  AuthNotifier() : super(AuthStatus.loading);

  void checkAuthStatus() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      state = AuthStatus.authenticated;
    } else {
      state = AuthStatus.unauthenticated;
    }
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthStatus>(
  (ref) {
    final authNotifier = AuthNotifier();
    authNotifier.checkAuthStatus();
    return authNotifier;
  },
);
