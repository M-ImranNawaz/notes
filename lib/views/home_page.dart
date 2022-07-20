import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeController c = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                height: 300,
                width: double.infinity,
                color: Colors.amber,
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 210,
                ),
                const Text(
                  'Welcome',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 40,
                ),
                Obx(() => c.pages.elementAt(c.index.value)),
                const SizedBox(
                  height: 10,
                ),
                Obx(
                  () => c.index.value == 0
                      ? button('Don\'t', 'Register', () {
                          c.index.value++;
                        })
                      : button('Already', 'Login', () {
                          c.index.value--;
                        }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget button(String t1, String t2, Function() func) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$t1 have an account? '),
        InkWell(
          onTap: func,
          child: Text(
            '$t2 here',
            style: TextStyle(color: Colors.amber.shade900),
          ),
        )
      ],
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.quadraticBezierTo(
        size.width * 0, size.height * 0, 0.78, size.height * 0.4766200);
    path0.cubicTo(
        size.width * 0.4105750,
        size.height * 1.0544800,
        size.width * 0.5017750,
        size.height * 0.1695600,
        size.width,
        size.height * 0.68040000);
    path0.quadraticBezierTo(
        size.width * 0.9998875, size.height * 1.0544800, size.width, 0);
    path0.lineTo(0, 0);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
