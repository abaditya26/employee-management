import 'package:employee_management/pages/login_page.dart';
import 'package:employee_management/services/database_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class AuthServices {
  final _auth = FirebaseAuth.instance;
  final _db = DatabaseServices();
  Future<UserCredential> signInWithEmail(String email, String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<String> isUserLoggedIn(BuildContext context) async {
    try {
      if (_auth.currentUser != null) {
        bool isAdmin = await _db.isUserAdmin(_auth.currentUser!.uid);
        if (isAdmin) {
          return "admin";
        } else {
          return "user";
        }
      } else {
        return "false";
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
      return "false";
    }
  }

  signOutUser(BuildContext context) async {
    _auth.signOut().then((value) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => MainApp()), (route) => false);
    }).catchError((e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error while logging out :- $e")));
    });
  }

  String getUid(){
    return _auth.currentUser!.uid;
  }

  Future<void> changePassword(String newPassword){
    return _auth.currentUser!.updatePassword(newPassword);
  }
}
