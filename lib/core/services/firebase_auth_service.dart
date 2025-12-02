import '/core/networking/errors/custom_execption.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final _googleSignIn = GoogleSignIn.instance;
  Future<User> signInWithGoogle() async {
    // Initialize GoogleSignIn with server client ID
    // await _googleSignIn.initialize(
    //   serverClientId:
    //       '792698485199-sp3p3jl9rvqlhuvehk4p20agkg1t1oe6.apps.googleusercontent.com',
    // );

    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password' ||
          e.code == 'invalid-email' ||
          e.code == 'user-not-found') {
        throw CustomException(message: 'Invalid credentials provided.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
          message:
              'Network error. Please check your internet connection and try again.',
        );
      } else {
        throw CustomException(
          message: 'An error occurred during authentication.',
        );
      }
    } catch (e) {
      throw CustomException(
        message: 'An error occurred during authentication.',
      );
    }
  }

  Future<User> signUpWithEmailAndPassword({
    required String emailAddress,
    required String password,
    String? name,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );

      // Update the user's profile with display name
      if (name != null && credential.user != null) {
        await credential.user!.updateProfile(displayName: name);
        await credential.user!.reload();
      }

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use' || e.code == 'weak-password') {
        throw CustomException(message: 'Invalid credentials provided.');
      } else {
        throw CustomException(
          message: 'An error occurred during authentication.',
        );
      }
    } catch (e) {
      throw CustomException(
        message: 'An error occurred during authentication.',
      );
    }
  }

  Future<void> deleteUser() async {
    await FirebaseAuth.instance.currentUser?.delete();
  }

  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
