import 'package:appmobile/screens/details/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:appmobile/constants.dart';
import 'package:flutter_svg/svg.dart';

import 'header_with_serchbox.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithSearchbox(size: size),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: TextField(
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: "rechercher dans Stock",
                      hintStyle: TextStyle(
                        color: kTextColor.withOpacity(0.5),
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(width: kDefaultPadding),
                SvgPicture.asset("assets/icons/search.svg"),
              ],
            ),
          ),
          SizedBox(height: kDefaultPadding),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => detailsScreen()),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: [
                    Image.asset(
                      'assets/images/image1.png',
                      width: size.width * 0.2,
                    ),
                    Text(
                      'Machine à Expresso',
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/images/image2.jpg',
                      width: size.width * 0.1,
                    ),
                    Text(
                      'Cafetière à piston',
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: kDefaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: [
                  Image.asset(
                    'assets/images/image3.jpg',
                    width: size.width * 0.2,
                  ),
                  Text(
                    'Moka Express',
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/image6.jpg',
                    width: size.width * 0.2,
                  ),
                  Text(
                    'La machine à dosette',
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
