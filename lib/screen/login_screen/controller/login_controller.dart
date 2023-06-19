import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firelogin/utils/login_helper.dart';
import 'package:get/get.dart';

import '../../modelpage.dart';

class logincontroller extends GetxController{
  void login()
  {
    FirebaseHelper.firebaseHelper.googleSignIn();
  }
  RxMap userDetail = {}.obs;
  List<HomeModel> productList = [];

  Stream<QuerySnapshot<Map<String, dynamic>>> readData() {
    return FirebaseHelper.firebaseHelper.readProduct();
  }
}