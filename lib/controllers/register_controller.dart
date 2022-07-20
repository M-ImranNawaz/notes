import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/constants.dart';
import 'package:notes/controllers/base_controller.dart';
import 'package:notes/models/user.dart';
import '../services/base_client.dart';

class RegisterController extends GetxController with BaseController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController userNameC, emailC, passwordC;
  @override
  void onInit() {
    super.onInit();
    emailC = TextEditingController();
    passwordC = TextEditingController();
    userNameC = TextEditingController();
  }

  register() async {
    var form = formKey.currentState!;
    if (form.validate()) {
      showLoading();
      BaseClient client = BaseClient();
      User user = User(
          userName: userNameC.text.toString().trim(),
          email: emailC.text.toString().trim(),
          password: passwordC.text.toString().trim());

      var res = await client
          .post(kBaseUrl, 'users/signup', user.toJson())
          .catchError(handleError);
      hideLoading();
      print(res);
    } else {}
  }
}
