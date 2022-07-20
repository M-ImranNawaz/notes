import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/controllers/login_controller.dart';
import 'package:notes/views/views.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);
  final LoginController c = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Form(
        key: c.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Login Here',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormFieldWidget(
              controller: c.emailC,
              icon: Icons.email,
              label: 'Email Address',
              tInputType: TextInputType.emailAddress,
              validator: (value) {
                if (!value.toString().isEmail) {
                  return "Please provide correct email";
                }
              },
            ),
            PasswordFormField(
              controller: c.passwordC, validator: (value) { }),
            ButtonWidget(
                onPressed: () {
                  c.login();
                },
                title: 'Login'),
          ],
        ),
      ),
    );
  }
}
