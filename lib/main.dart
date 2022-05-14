// ignore_for_file: use_key_in_widget_constructors

import 'package:dr_rateb_nabulsi_app/screens/home_screen.dart';
import 'package:dr_rateb_nabulsi_app/screens/login_screen.dart';
import 'package:dr_rateb_nabulsi_app/screens/user_profile_screen.dart';
import 'package:dr_rateb_nabulsi_app/screens/welcom_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Nabulsie());
}

class Nabulsie extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'موسوعه النابلسي',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
     initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id :(context)=>WelcomeScreen(),
        HomeScreen.id:(context)=>HomeScreen(),
        UserProfileScreen.id:(context)=>UserProfileScreen(),
        LoginScreen.id:(context)=>LoginScreen(),
      },
    );
  }
}

