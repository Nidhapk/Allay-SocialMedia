import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socialmediaapp/core/services/auth_services.dart';
import 'package:socialmediaapp/viewmodels/states/login_state.dart';

final authStateProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

class LoginNotifier extends StateNotifier<LoginState> {
  final AuthServices authService;

  LoginNotifier(this.authService) : super(LoginState.initial());

  Future<void> login(String email, String password) async {
    state =
        state.copyWith(isLoading: true, errorMessage: null, isSuccess: false);
    try {
      await authService.signIn(email, password);
      state = state.copyWith(isLoading: false, isSuccess: true);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }

  void resetState() {
    state = LoginState.initial();
  }
}

final authServiceProvider = Provider((ref) => AuthServices());
final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  final authService = ref.watch(authServiceProvider);
  return LoginNotifier(authService);
});

