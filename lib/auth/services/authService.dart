import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  // Instance of Firebase Auth and Firestore
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign up with Email and Password
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
    required BuildContext context, // Added context
  }) async {
    String res = "Some error occurred";
    try {
      // Creating the user using Firebase Auth
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Adding user to Firestore
      await _firestore.collection("users").doc(credential.user!.uid).set({
        'name': name,
        'email': email,
        'uid': credential.user!.uid,
      });

      res = "success";
    } catch (e) {
      // Handle FirebaseAuthException
      print(e.toString());
    }
    return res;
  }
}