import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{
  // Private constructor
  AuthService._ctor();
  // Create an instance of the AuthService
  static final AuthService instance = AuthService._ctor();
  // Get the current user
  User? get user => _auth.currentUser;

  // Use firebase_auth to authenticate users
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Check if user is already signed in
  Future<bool> isLoggedIn() async {
    final currentUser = _auth.currentUser;
    return currentUser != null;
  }

  // Register with email and password
  Future<void> register(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  // Register with Apple
  Future<void> registerWithApple() async {
    // Not implemented
    // Notes: Apple sign in requires a custom backend
    // See: https://pub.dev/packages/sign_in_with_apple
  }

  // Register with Google
  Future<void> registerWithGoogle() async {
    await signInWithGoogle(); // Google sign in also registers the user
  }

  // Sign in with email and password
  Future<void> signIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  // Sign in with Apple
  Future<void> signInWithApple() async {
    // Not implemented
  }

  // Sign in with Google
  Future<void> signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    final auth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: auth?.accessToken,
      idToken: auth?.idToken,
    );

    await _auth.signInWithCredential(credential);
  }

  // Reset password
  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}