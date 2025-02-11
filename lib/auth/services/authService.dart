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
      if(name.isNotEmpty || email.isNotEmpty || password.isNotEmpty ){
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _firestore.collection("users").doc(credential.user!.uid).set({
        'name': name,
        'email': email,
        'uid': credential.user!.uid,
      });

      res = "success";}
    } catch (e) {
      // Handle FirebaseAuthException
    return e.toString();
    }
    return res;
  }
  // Login with email and password
  Future<String> loginUser({
  required String email,
  required String password,
  required BuildContext context,
  })async{
  String res = "Some error occurred";
   try{
      if(email.isNotEmpty || password.isNotEmpty){
      await _auth.signInWithEmailAndPassword(
          email: email,
          password: password);
      res = "success";
      }else{
      res ="Please enter all field";
      }
   }catch(e){
    return e.toString();
   }
  return res;
  }

  //LOGOUT FUNCTION
Future<void> logOut() async{
    await _auth.signOut();
}
}