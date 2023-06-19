import 'package:flutter/material.dart';

import '../../Home_page.dart';
import '../../cartpage/view/cartscreen.dart';
import '../../detailpage/view/Deatil_screen.dart';

class Bottomscreen extends StatefulWidget {
  const Bottomscreen({Key? key}) : super(key: key);

  @override
  State<Bottomscreen> createState() => _BottomscreenState();
}

class _BottomscreenState extends State<Bottomscreen> {
  List screens = [HomeScreen(), Cart_screen(), detail_screen()];
  int change = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[change],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.shifting,
          currentIndex: change,
          onTap: (value) {
            setState(() {
              change = value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "setting"),
          ],
        ),
      ),
    );
  }
}
