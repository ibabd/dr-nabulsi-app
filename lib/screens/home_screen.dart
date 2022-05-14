// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_print


import 'package:dr_rateb_nabulsi_app/screens/login_screen.dart';
import 'package:dr_rateb_nabulsi_app/screens/user_profile_screen.dart';
import 'package:dr_rateb_nabulsi_app/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatefulWidget {
  static const id='homeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseService authService=FirebaseService();
  @override
 void initState() {
    super.initState();
    if(Platform.isAndroid){
      WebView.platform=SurfaceAndroidWebView();
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
          onWillPop: ()async=>false,
          child: Scaffold(
            appBar: AppBar(
              //حتى يتم الغاء السهم الرجوع من الشاشه الى بيكون فى الappBar
             // automaticallyImplyLeading: false,
              title: Text('الدكتور راتب النابلسى'),
              leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
                Navigator.of(context).pushNamed(HomeScreen.id);
              },),

              actions: [
                IconButton(
                  onPressed: (){
                    Navigator.of(context).pushNamed(UserProfileScreen.id);
                  },
                  icon: Icon(Icons.person),
                ),
                SizedBox(width: 20),
                IconButton(
                    onPressed: (){
                     // Navigator.of(context).pushNamed(ChatScreen.id);
                      authService.signOut();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));
                    },
                    icon: Icon(Icons.logout),
                ),
              ],
            ),
            body: WebView(
              initialUrl: 'https://www.nabulsi.com/',
              //من اجل اجهزة الاندرويد
              javascriptMode: JavascriptMode.unrestricted,
            ),
          ),
        ),
    );
  }
}
