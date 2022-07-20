import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/register_controller.dart';
import 'views.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({
    Key? key,
  }) : super(key: key);
  final RegisterController c = Get.put(RegisterController());
  RegExp rex = RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
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
              'Register Here',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormFieldWidget(
                controller: c.userNameC,
                icon: Icons.person,
                label: 'Full Name',
                validator: (value) {
                  if (rex.hasMatch(value)) {
                    return "Please provide correct Name";
                  }
                }),
            TextFormFieldWidget(
              controller: c.emailC,
              icon: Icons.email,
              label: 'Email Address',
              validator: (value) {
                if (!value.toString().isEmail) {
                  return "Please provide correct email";
                }
              },
              tInputType: TextInputType.emailAddress,
            ),
            PasswordFormField(controller: c.passwordC, validator: (value) {}),
            ButtonWidget(
                onPressed: () {
                  c.register();
                },
                title: 'Register'),
          ],
        ),
      ),
    );
  }
}
