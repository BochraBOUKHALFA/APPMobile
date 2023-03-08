import 'package:flutter/material.dart';
import 'package:flutter_3d_obj/flutter_3d_obj.dart';

class detailsScreen extends StatelessWidget {
  final object = new Object3D(
      size: Size(200, 200),
      path: 'assets/3DObjects/Coffee_Maker.obj',
      asset: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.centerRight, child: Center(child: object),
        // Container(
        //   width: 10.0,
        //   height: 10.0,
        //   child:
        //    Image.asset(
        //     'images/PayeTonKahwa_logo.png',
        //     fit: BoxFit.contain,
        //   ),
        // ),
      ),
    );
  }
}
