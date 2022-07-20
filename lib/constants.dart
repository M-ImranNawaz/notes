import 'package:flutter/material.dart';
import 'package:notes/main.dart';

const String url = "192.168.8.100";
const kBaseUrl = "https://notes-appapi.herokuapp.com/";

navTo(page) {
  Navigator.pushReplacement(navigatorkey.currentState!.context, MaterialPageRoute(builder: (_)=> page));
}