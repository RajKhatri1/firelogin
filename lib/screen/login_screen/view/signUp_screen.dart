import 'package:firelogin/utils/login_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.blueGrey.shade100,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Image.asset("assets/images/logo.png", height: 80),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Sing up",
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold
                    // letterSpacing: 1,
                  ),
                ),
                SizedBox(height: 5.h),
                Center(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: txtemail,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.blueGrey.shade700)),
                              // hintText: "xyz@gmail.com",
                              label: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Email",
                                    style: TextStyle(
                                        color: Colors.blueGrey.shade700)),
                              ),
                              prefixIcon: Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.orange.shade100,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Icon(Icons.email,
                                    size: 25,
                                    color: Colors.deepOrange.shade300),
                              )),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        TextField(
                            controller: txtpassword,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                label: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Password",
                                      style: TextStyle(
                                          color: Colors.blueGrey.shade700)),
                                ),
                                // hintText: "Enter password",
                                prefixIcon: Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.orange.shade100,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Icon(Icons.lock,
                                      size: 25,
                                      color: Colors.deepOrange.shade300),
                                ))),
                        const SizedBox(
                          height: 5,
                        ),
                        const Align(
                            alignment: Alignment.centerRight,
                            child: Text("Forgot password?")),
                        SizedBox(
                          height: 5.h,
                        ),
                        InkWell(
                            onTap: () async {
                              String? msg = await FirebaseHelper.firebaseHelper
                                  .signUp(
                                  email: txtemail.text,
                                  password: txtpassword.text);
                              Get.snackbar(
                                  "${msg == true ? "SuccessxFully Logon" : "Fail to login"}",
                                  "firebase app");
                              if (msg == true) {
                                Get.offAndToNamed("/signin");
                              }
                            },
                            child: Container(
                                height: 60,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: Colors.orange.shade500,
                                    borderRadius: BorderRadius.circular(30)),
                                child: const Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Sign up",
                                      style: TextStyle(
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    )))),
                        SizedBox(
                          height: 10.sp,
                        ),
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("---------------------"),
                            const SizedBox(
                              width: 2,
                            ),
                            const Text("Or"),
                            const SizedBox(
                              width: 2,
                            ),
                            const Text("---------------------"),
                          ],
                        ),
                        const SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),boxShadow: [const BoxShadow(blurStyle: BlurStyle.inner,color: Colors.white)]),
                              height: 45,
                              width: 45,
                              child:Image.asset("assets/images/fb.png"),
                            ),
                            const SizedBox(width: 20,),
                            InkWell(
                              onTap: () async {

                                await FirebaseHelper.firebaseHelper.googleSignIn();
                                Get.offAndToNamed("/home");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),boxShadow: [const BoxShadow(blurStyle: BlurStyle.inner,color: Colors.white)]),
                                height: 50,
                                width: 50,
                                child: Image.asset("assets/images/google.png"),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 50.sp),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have account ?",style: TextStyle(fontSize: 15)),
                            TextButton(
                                onPressed: () {
                                  Get.toNamed('/signin');
                                },
                                child: Text(
                                  "Log in",
                                  style: TextStyle(
                                      color: Colors.blueGrey.shade900,fontWeight: FontWeight.bold,fontSize: 16),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
