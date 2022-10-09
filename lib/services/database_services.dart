import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_management/models/task_model.dart';
import 'package:employee_management/models/user_model.dart';
import 'package:employee_management/services/auth_services.dart';

class DatabaseServices {
  final _db = FirebaseFirestore.instance;
  Future<void> addUserData(UserModel user) {
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

  Future<UserModel> getUserData() async {
    String uid = AuthServices().getUid();
    DocumentSnapshot snap = await _db.collection("users").doc(uid).get();
    return UserModel(
        uid: snap["uid"],
        email: snap["email"],
        name: snap["name"],
        contactNo: snap["contactNo"],
        department: snap["department"],
        joiningDate: snap["joiningDate"],
        profileImage: snap["profileImage"]
    );
  }


  Future<void> updateUserData(UserModel user)async {
    return _db.collection("users").doc(user.uid).update(user.toMap());
  }
}
