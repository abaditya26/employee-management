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

  Future<UserCredential> createUserWithEmail(
    String email,
  ) {
    return _auth.createUserWithEmailAndPassword(email: email, password: email);
  }

  Future<Map<String, dynamic>> isUserLoggedIn(BuildContext context) async {
    try {
      if (_auth.currentUser != null) {
        Map<String, dynamic> isAdmin =
            await _db.validateUser(_auth.currentUser!.uid);
        if (isAdmin["active"]) {
          if (isAdmin["admin"]) {
            return {"role": "admin", "message": ""};
          } else {
            return {"role": "user", "message": ""};
          }
        } else {
          return {
            "role": "false",
            "message": "User is deactivated. Please contact Admin."
          };
        }
      } else {
        return {"role": "false", "message": "User Data Unavailable"};
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
      return {"role": "false", "message": ""};
    }
  }

  signOutUser(BuildContext context, String? str) async {
    _auth.signOut().then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => MainApp(
                    err: str,
                  )),
          (route) => false);
    }).catchError((e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error while logging out :- $e")));
    });
  }

  String getUid() {
    return _auth.currentUser!.uid;
  }

  Future<void> changePassword(String newPassword) {
    return _auth.currentUser!.updatePassword(newPassword);
  }
}
