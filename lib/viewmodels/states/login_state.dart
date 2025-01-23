class LoginState {
  final bool isLoading;
  final bool isSuccess; // Indicates if login is successful
  final String? errorMessage;

  LoginState({
    required this.isLoading,
    required this.isSuccess,
    this.errorMessage,
  });

  // Initial state with loading and success as false, and no error
  factory LoginState.initial() {
    return LoginState(isLoading: false, isSuccess: false, errorMessage: null);
  }

  // Create a copy of the state with updated values
  LoginState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}