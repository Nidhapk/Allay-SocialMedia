// Email validation function
String? validateEmail(String? email) {
  if (email == null || email.isEmpty) {
    return 'Please enter your email';
  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
    return 'Please enter a valid email';
  }
  return null;
}

// Password validation function
String? validatePassword(String? password) {
  if (password == null || password.isEmpty) {
    return 'Please enter your password';
  } else if (password.length < 6) {
    return 'Password should be at least 6 characters';
  }
  return null;
}