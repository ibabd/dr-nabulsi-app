// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:dr_rateb_nabulsi_app/component/button.dart';
import 'package:dr_rateb_nabulsi_app/services/firebase_services.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'loginScreen';

  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseService firebaseService=FirebaseService();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SizedBox(
          height: size.height,
          width: double.infinity,
          child: Stack(
            children: [
              Column(
                //  mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: SizedBox(),
                  ),
                  Center(
                    child: Image.asset(
                      'images/logo1.jpg',
                      width: size.width / 2,
                    ),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Text(
                    'Login With',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  RoundedButton(
                      colour: Colors.teal,
                      title: 'Login With Phone',
                      onPressed: (){},
                      textColor: Colors.white,
                      iconColor: Colors.white,
                      buttonIcon: Icons.phone,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.teal
                    ),

                    child: TextButton(
                      onPressed: (){
                        firebaseService.googleSignInMethod(context);
                      },
                      child: Row(
                        children: [
                          Image.asset('images/google.jpg',
                            height:40 ,
                            width:40,
                          ),
                          SizedBox(width: 50,),
                          // CustomText(text: 'Sign in with Google',color: Colors.white,),
                          Text('Sign in with Google',style: TextStyle(color: Colors.black,fontSize: 17),),
                        ],
                      ),
                    ),
                  ),

              ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
