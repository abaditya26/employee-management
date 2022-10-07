import 'package:firebase_auth/firebase_auth.dart';

class AuthServices{
  final _auth = FirebaseAuth.instance;
  Future<UserCredential> signInWithEmail(String email, String password){
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }
}