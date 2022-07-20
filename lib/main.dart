import 'package:flutter/material.dart';
import '../views/views.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
final navigatorkey = GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final  token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImlrMTJAZ21haWwuY29tIiwiaWQiOiI2MmQyYWM2MTU3MjQzMGFkMGU4NjVjYWEiLCJpYXQiOjE2NTgwNTM1Njd9.2kCUhZgtFeEX_DH_ZXEPq4pNuZ6WOy0ztUgyqF-1hCw";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorkey,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: HomePage(),
    );
  }
}
//hide keyboard
// FocusManager.instance.primaryFocus?.unfocus();