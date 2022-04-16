import 'package:flutter/material.dart';

class ProfileClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path p=Path();
    p.lineTo(0, 3*size.height/5);
    p.quadraticBezierTo(size.width/2, size.height, size.width,
        3*size.height/5);
    p.lineTo(size.width, 0);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }


}