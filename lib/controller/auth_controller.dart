import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthController with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

User? get user{
  return _auth.currentUser;
}
 
  signInAnon() {
    try {
      _auth.signInAnonymously();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  signOut() {
    try {
      _auth.signOut();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
