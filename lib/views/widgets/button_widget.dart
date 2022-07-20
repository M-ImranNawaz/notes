import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key, required this.onPressed, required this.title})
      : super(key: key);
  final Function() onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
          style: TextButton.styleFrom(
              maximumSize: const Size(double.infinity, 55),
              minimumSize: const Size(double.infinity, 55),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ), 
          onPressed: onPressed,
          child: Text(
            title,
            style: const TextStyle(fontSize: 18),
          )),
    );
  }
}
