import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:levelupirl/screens/home_screen.dart';
import 'package:levelupirl/screens/login_screen.dart';

class AppNavigation{
  static void goHome(BuildContext context){
    if(Platform.isIOS){
      Navigator.of(context).pushAndRemoveUntil(CupertinoPageRoute(builder: (context) => const HomeScreen()), (route) => false);
    }
    else{
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const HomeScreen()), (route) => false);
    }
  }

  static void goToLogin(BuildContext context){
    if(Platform.isIOS){
      Navigator.of(context).pushAndRemoveUntil(CupertinoPageRoute(builder: (context) => const LoginScreen()), (route) => false);
    }
    else{
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginScreen()), (route) => false);
    }
  }
}