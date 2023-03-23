import 'dart:math';

import 'package:flutter/material.dart';

class AppBanner extends StatelessWidget {
  const AppBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 150,
      margin: EdgeInsets.only(top: 50),
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/green_milk_tea_canva.png'),
      )),
    );
  }
}
