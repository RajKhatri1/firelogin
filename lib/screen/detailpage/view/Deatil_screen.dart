import 'package:firelogin/screen/cartpage/controller/cartcontroller.dart';
import 'package:firelogin/screen/modelpage.dart';
import 'package:firelogin/utils/login_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../login_screen/controller/login_controller.dart';

class detail_screen extends StatefulWidget {
  const detail_screen({Key? key}) : super(key: key);

  @override
  State<detail_screen> createState() => _detail_screenState();
}

class _detail_screenState extends State<detail_screen> {
  HomeModel? h1 = Get.arguments;
  logincontroller controller = Get.put(
    logincontroller(),
  );
  cartcontroller cc = Get.put(
    cartcontroller(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Column(
          children: [
            SizedBox(
              height: 20.sp,
            ),
            Container(
                height: 300,
                width: 250,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      "${h1?.image}",
                      fit: BoxFit.cover,
                    ))),
            Expanded(
              child:  SizedBox(
                height: 30,
              ),
            ),
            Container(
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40))),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "${h1?.Name}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25.sp),
                        ),
                        Expanded(child: SizedBox()),
                        Text(
                          "₹ ${h1?.Price}",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 20.sp),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.",
                      style: TextStyle(color: Colors.grey, letterSpacing: 0.8),
                    ),
                    SizedBox(height: 10.sp,),
                    Text("Colors",style: TextStyle(letterSpacing: 1,color: Colors.black54,fontWeight: FontWeight.bold),),
                    SizedBox(height: 5.sp,),
                    Row(
                      children: [
                        Container(height: 22.sp,width:22.sp,decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.black),),
                        SizedBox(width: 3.sp,),
                        Container(height: 22.sp,width:22.sp,decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.red),),
                        SizedBox(width: 3.sp,),

                        Container(height: 22.sp,width:22.sp,decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.purple),),
                        SizedBox(width: 3.sp,),

                        Container(height: 22.sp,width:22.sp,decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.blue),),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
                          onPressed: () {
                            FirebaseHelper.firebaseHelper.cartadd(
                                name: h1?.Name,
                                price: h1?.Price,
                                image: h1?.image,
                                category: h1?.Category);
                            Get.back();
                          },
                          child: const Text("add to cart")),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
