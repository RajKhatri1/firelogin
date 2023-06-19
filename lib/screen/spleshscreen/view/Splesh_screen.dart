import 'dart:async';

import 'package:firelogin/utils/login_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class splesh_screen extends StatefulWidget {
  const splesh_screen({Key? key}) : super(key: key);

  @override
  State<splesh_screen> createState() => _splesh_screenState();
}

class _splesh_screenState extends State<splesh_screen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () async {
      bool msg=await FirebaseHelper.firebaseHelper.checkLogin();
      Get.offAndToNamed(msg?'/bottom':'/signin');
    });
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Image.asset("assets/images/logo.png",height: 130),
        ),
      ),
    );
  }
}
