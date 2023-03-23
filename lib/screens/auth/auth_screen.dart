import 'package:flutter/material.dart';

import 'package:order_app/screens/home/components/bottom_nav_bar.dart';
import 'package:order_app/screens/home/details/components/app_bar.dart';

import "app_banner.dart";

import 'auth_card.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
          ),
          SizedBox(
            width: deviceSize.width,
            child: Column(
              children: [AppBanner(), AuthCard()],
            ),
          ),
        ],
      ),
      //  bottomNavigationBar: BottomNavBar(),
    );
  }
}
