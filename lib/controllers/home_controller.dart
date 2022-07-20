import 'package:get/get.dart';

import '../views/views.dart';


class HomeController extends GetxController {
  final pages =  [
    LoginPage(),
    RegisterPage(),
    
  ];
  var index = 0.obs;
}
