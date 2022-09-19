import 'dart:async';
// import 'dart:html';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  User? user = FirebaseAuth.instance.currentUser;
  Stream<User?> userStram = FirebaseAuth.instance.authStateChanges();

  Future<UserCredential?> signInByEmail(
      formKey, myemail, mypassword, context) async {
    var formData = formKey.currentState;
    if (formData!.validate()) {
      formData.save();
      try {
        UserCredential credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: myemail,
          password: mypassword,
        );
        return credential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          AwesomeDialog(
              context: context,
              title: 'Error',
              body: const Text(
                'The password provided is too weak.\n',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              )).show();
        } else if (e.code == 'email-already-in-use') {
          AwesomeDialog(
              showCloseIcon: true,
              context: context,
              title: 'Error',
              body: const Text(
                'The account already exists for that email.\n',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              )).show();
        }
      } catch (e) {
        print(e);
      }
    } else {
      print('Not Valid');
    }
    return null;
  }

  Future<UserCredential?> signInWithGoogle(context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      var result = await FirebaseAuth.instance.signInWithCredential(credential);
      User? user = result.user;
      updateUserData(user) {}
      return result;
    } catch (error) {
      AwesomeDialog(
          context: context,
          title: 'error',
          body: Text(
            error.toString(),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )).show();
      return null;
    }
    // Trigger the authentication flow
  }

  Future<UserCredential?> signInWithFacebook(context) async {
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
      var result = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      User? user = result.user;
      updateUserData(user) {}
      return result;
    } catch (error) {
      AwesomeDialog(
          context: context,
          title: 'error',
          body: Text(
            error.toString(),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )).show();
      return null;
    }
  }

  Future<void> updateUserData(User user) async {
    DocumentReference reportRef = _db.collection('reports').doc(user.uid);
    return reportRef.set({
      'uid': user.uid,
      'lastActivity': DateTime.now(),
    }, SetOptions(merge: true));
  }

  Future<void> signOut() {
    return FirebaseAuth.instance.signOut();
  }
}
