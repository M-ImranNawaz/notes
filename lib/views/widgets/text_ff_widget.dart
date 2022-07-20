import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String label;
  final Function validator;
  final TextInputType tInputType;
  const TextFormFieldWidget(
      {Key? key,
      required this.controller,
      required this.icon,
      required this.label,
      required this.validator,
      this.tInputType = TextInputType.name})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        keyboardType: tInputType,
        textInputAction: TextInputAction.next,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please fill Necessary Field';
          }
          return validator(value);
        },
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          prefixIcon: Icon(icon),
          labelText: label,
        ),
      ),
    );
  }
}
