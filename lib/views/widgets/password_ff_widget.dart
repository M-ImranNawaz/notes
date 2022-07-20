import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController controller;
  final Function validator;
  const PasswordFormField(
      {Key? key, required this.controller, required this.validator})
      : super(key: key);
  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool obsecure = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.next,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please fill Necessary Field';
          }
          int length = 5;
          if (value.length < length) {
            return 'Password length should be minimum $length';
          }
          return widget.validator(value);
        },
        controller: widget.controller,
        obscureText: obsecure,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          prefixIcon: const Icon(Icons.lock),
          labelText: 'Password',
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: InkWell(
                onTap: () {
                  obsecure = !obsecure;
                  setState(() {});
                },
                child: Icon(obsecure
                    ? FontAwesomeIcons.eye
                    : FontAwesomeIcons.eyeSlash)),
          ),
        ),
      ),
    );
  }
}
