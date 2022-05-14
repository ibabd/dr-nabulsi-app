// ignore_for_file: unnecessary_null_comparison
import 'package:dr_rateb_nabulsi_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
final FirebaseService authService=FirebaseService();
class FirebaseService {

  final GoogleSignIn _googleSignIn=GoogleSignIn();
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseFirestore _db=FirebaseFirestore.instance;
  PublishSubject loading =PublishSubject();
   //
   // Stream <User> ?user;
   // Stream<Map<String,dynamic>> ? profile;
   // FirebaseService(){
   //   user=Stream.castFrom(_auth.authStateChanges());
   //   profile=user!.switchMap((User u){
   //     if(u!=null){
   //       return _db.collection('Users').doc(u.uid).snapshots().map((snap) => snap.data()!);
   //     }else{
   //       return Stream.value({});
   //     }
   //    });
   //  }



  Future<User?> googleSignInMethod(context)async{
    final GoogleSignInAccount ? googleUser= await _googleSignIn.signIn();
    //للحصول على معلومات google auth
    GoogleSignInAuthentication googleSignInAuthentication=await googleUser!.authentication;
    //دة الى اقدر اجيب منها credential بتاعه الاكونت بتاع اليوزر الى عامل بيه sign in
    final AuthCredential credential= GoogleAuthProvider.credential(
      //بيحتاج منى حاجتين
      //
      idToken: googleSignInAuthentication.idToken,
      accessToken:googleSignInAuthentication.accessToken,
    );
    final authResult=await _auth.signInWithCredential(credential);
    if(authResult.user!=null){
      Navigator.pushNamed(context, HomeScreen.id);
    }
    updateUserData(authResult.user!);
    loading.add(false);
    return authResult.user;
  }
  void updateUserData(User user)async{
    DocumentReference ref=_db.collection('Users').doc(user.uid);
    return ref.set({
      'uid':user.uid,
      'email':user.email,
      'photoUrl':user.photoURL,
      'displayName':user.displayName,
      'lastSeen':DateTime.now(),
    });
  }

  //function save information of user in firebasee
  // void saveUser(UserCredential user)async{
  //
  //   UserModel userModel=UserModel(
  //     userId: user.user!.uid,
  //     email: user.user!.email,
  //     name: name ==null ?user.user!.displayName:name,
  //     picture:user.user!.photoURL,
  //   );
  //   await FireStoreUser().addUserToFirebase(userModel);
  //
  // }

  void signOut(){
    _auth.signOut();
  }

}
