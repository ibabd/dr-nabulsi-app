// ignore_for_file: prefer_typing_uninitialized_variables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final iconColor;
  final buttonColor;
  RoundIconButton(
      {required this.icon,
      required this.onPressed,
      this.iconColor,
      this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: iconColor,
      ),
      onPressed: onPressed,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      //shape: CircleBorder(),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      fillColor: buttonColor,
    );
  }
}

class RoundedButton extends StatelessWidget {
  final Color colour;
  final Color textColor;
  final Color iconColor;
  final String title;
  final VoidCallback onPressed;
  final buttonIcon;
  RoundedButton(
      {required this.colour,
      required this.title,
      required this.onPressed,
      required this.textColor,
      required this.iconColor,
      this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(10.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: Stack(
          children: [
            Padding(padding: EdgeInsets.only(left: 20,top: 10),
             child: Icon(
              buttonIcon,
              color: iconColor,
            ),
            ),
            MaterialButton(
                onPressed: onPressed,
                minWidth: 1000.0,
                height: 42.0,
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
            ),
          ],
        ),
      ),

    );
  }
}

class CurvedBottomClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    final roundingHeight=size.height*3/5;
    final filledRectangle=Rect.fromLTRB(0, 0, size.width, size.height-roundingHeight);
    final roundingRectangle=Rect.fromLTRB(-5, size.height-roundingHeight*2, size.width+5, size.height);
    final path=Path();
    path.addRect(filledRectangle);
    path.arcTo(roundingRectangle, pi, -pi, true);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path>oldClipper){
    return true;
  }
}
