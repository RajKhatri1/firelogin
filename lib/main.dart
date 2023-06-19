import 'package:firebase_core/firebase_core.dart';
import 'package:firelogin/screen/Home_page.dart';
import 'package:firelogin/screen/bottompage/view/bottomscreen.dart';
import 'package:firelogin/screen/cartpage/view/cartscreen.dart';
import 'package:firelogin/screen/detailpage/view/Deatil_screen.dart';
import 'package:firelogin/screen/login_screen/view/loginpage.dart';
import 'package:firelogin/screen/login_screen/view/signUp_screen.dart';
import 'package:firelogin/screen/spleshscreen/view/Splesh_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/splesh',
        getPages: [
          GetPage(
            name: '/',
            page: () => const Bottomscreen(),
          ),
          GetPage(
            name: '/Signin',
            page: () => const SignInScreen(),
          ),
          GetPage(
            name: '/splesh',
            page: () => const splesh_screen(),
          ),
          GetPage(
            name: '/bottom',
            page: () => const Bottomscreen(),
          ),
          GetPage(
            name: '/Singup',
            page: () => const SignupScreen(),
          ),
          GetPage(
            name: '/detail',
            page: () => const detail_screen(),
          ),
          GetPage(
            name: '/home',
            page: () => const HomeScreen(),
          ),
          GetPage(
            name: '/cart',
            page: () => const Cart_screen(),
          ),
        ],
      ),
    ),
  );
}