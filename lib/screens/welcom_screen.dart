// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dr_rateb_nabulsi_app/screens/home_screen.dart';
import 'package:dr_rateb_nabulsi_app/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = 'welcomeScreen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {

      final FirebaseAuth _auth=FirebaseAuth.instance;
      if(_auth.currentUser!=null){
        Navigator.of(context).pushNamed(HomeScreen.id);
      }else{
      Navigator.of(context).pushNamed(LoginScreen.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      //عند الضغط على زرار العودة لا يخرج من التطبيق
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SizedBox(
          height: size.height,
          width: double.infinity,
          child: Stack(
            children: [
              // Positioned(
              //   top: 0,
              //   left: 0,
              //   child: Image.asset(
              //     'images/',
              //     width: size.width * 0.3,
              //   ),
              // ),
              // Positioned(
              //   bottom: 0,
              //   left: 0,
              //   child: Image.asset(
              //     'images/',
              //     width: size.width * 0.4,
              //   ),
              // ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'موسوعة النابلسي',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple),
                    ),
                    Image.asset('images/nabulsi1.jpg',width: size.width*.4,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
