import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  static final Authentication _instance = Authentication._internal();
  factory Authentication() => _instance;
  Authentication._internal();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;

  Future<User?> signIn(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleAuthProvider googleProvider = GoogleAuthProvider();
      final UserCredential userCredential = await _auth.signInWithPopup(googleProvider);
      user = userCredential.user;
      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<User?> signInWithApple() async {
    try {
      final OAuthProvider appleProvider = OAuthProvider('apple.com');
      final UserCredential userCredential = await _auth.signInWithPopup(appleProvider);
      user = userCredential.user;
      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<User?> signUp(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      user = null;
    } catch (e) {
      throw e;
    }
  }
}