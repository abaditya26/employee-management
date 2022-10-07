import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_management/models/user_model.dart';

class DatabaseServices{
  final _db = FirebaseFirestore.instance;
  addUserData(UserModel user){
    return _db.collection("users").doc(user.uid).set(user.toMap());
  }

  Future<bool> isUserAdmin(String uid) async {
    DocumentSnapshot documentSnapshot = await _db.collection("users").doc(uid).get();
    if(documentSnapshot.exists) {
      if (documentSnapshot.get("role") == "admin") {
        return true;
      }
    }
    return false;
  }
}