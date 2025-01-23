import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final firebaseAuth = FirebaseAuth.instance;
  Future<User?> signIn(String email, String password) async {
    try {
      final UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }

  Future<User?> signUp(String email, String password) async {
    try {
      final UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (_) {
      rethrow;
    }
  }

  
signOut() async {
    try {
      await firebaseAuth.signOut();
    } on FirebaseAuthException catch (_) {
      rethrow;
    }
  }


//to get firebase token
Future<String?> getFirebaseToken() async {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    return await user.getIdToken();
  }
  return null;
}
 
}
