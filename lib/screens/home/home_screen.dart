import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'components/body.dart';
import 'package:appmobile/constants.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: kPrimaryColor,
      leading: IconButton(
          icon: SvgPicture.asset("assets/icons/menu.svg"), onPressed: () {}),
    );
  }
}
