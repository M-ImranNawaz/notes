import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/controllers/base_controller.dart';
import 'package:notes/views/notes_page.dart';

import '../constants.dart';
import '../services/base_client.dart';

class LoginController extends GetxController with BaseController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController emailC, passwordC;
  @override
  void onInit() {
    super.onInit();
    emailC = TextEditingController();
    passwordC = TextEditingController();
  }

  login() async {
    var form = formKey.currentState!;
    if (form.validate()) {
      BaseClient client = BaseClient();
      showLoading();
      var payload = {
        "email": emailC.text.toString().trim(),
        "password": passwordC.text.toString().trim()
      };
      var res =
          await client.post(kBaseUrl, 'users/signin', jsonEncode(payload)).catchError(handleError);
      hideLoading();
      if (res.toString().contains(emailC.text.toString().trim())) {
        navTo(NotesPage(token: res['token'],user: res['user']));
      }
    }
  }
}
