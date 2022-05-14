// ignore_for_file: prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dr_rateb_nabulsi_app/model/user_model.dart';

class FireStoreUser{
  CollectionReference _usersRef=FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFirebase(UserModel userModel)async{
    return await _usersRef.doc(userModel.userId).set(userModel.toJson());
  }
  Future<DocumentSnapshot> getCurrentUser(String uid)async{
    return await _usersRef.doc(uid).get();
  }

}