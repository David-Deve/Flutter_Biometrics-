import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fluttertest/Container/homePage.dart';

import 'package:flutter/material.dart';
import 'package:fluttertest/Container/loading.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';

import 'Container/accountPage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AnimatedSplashScreen(
      duration: 3000,
      splash: const Column(
        children: [
          Icon(Icons.account_balance),
          Text("ABA BANK"),
        ],
      ),
      backgroundColor: HexColor('#0D3A56'),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      nextScreen: const HomePage(),
    ),

    theme: ThemeData(scaffoldBackgroundColor: HexColor('#0D3A56')),
    // initialRoute: '/home',
    // routes: {
    //   '/loading': (context) => const Loading(),
    //   '/home': (context) => const HomePage(),
    //   '/account': (context) => const AccountPage()
    // },
  ));
}
