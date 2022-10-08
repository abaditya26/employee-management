import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_management/models/task_model.dart';
import 'package:employee_management/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class DatabaseServices {
  final _db = FirebaseFirestore.instance;
  addUserData(UserModel user) {
    return _db.collection("users").doc(user.uid).set(user.toMap());
  }

  Future<bool> isUserAdmin(String uid) async {
    DocumentSnapshot documentSnapshot =
        await _db.collection("users").doc(uid).get();
    if (documentSnapshot.exists) {
      if (documentSnapshot.get("role") == "admin") {
        return true;
      }
    }
    return false;
  }

  Future<void> saveTask(TaskModel task) async {
    DocumentReference ref = await _db
        .collection("users")
        .doc(task.uid)
        .collection("tasks")
        .add(task.toMap());
    return _db.collection("users").doc(task.uid).collection("tasks").doc(ref.id).update(
        {"id":ref.id});
  }
}
