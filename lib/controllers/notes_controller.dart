import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/controllers/base_controller.dart';
import 'package:notes/main.dart';
import 'package:notes/services/base_client.dart';
import '../constants.dart';
import '../models/note.dart';

class NotesController extends GetxController with BaseController {
  String title = '';
  String description = '';
  //RxList<Note> notes = <Note>[].obs;
  List<Note> notes = <Note>[].obs;
  late TextEditingController titleC, descriptionC;
  RxBool isLoading = true.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    super.onInit();
    titleC = TextEditingController();
    descriptionC = TextEditingController();
  }

  getNotes(String token) async {
    BaseClient client = BaseClient();
    // final response = await h.get(Uri.parse("${kBaseUrl}note"),
    //     headers: {"Authorization": "Bearer $token"});
    // if (response.statusCode == 200) {
    //   final note = noteFromJson(response.body);
    //   print(note.first.description);
    //   notes = note;
    //   isLoading.value = false;
    // } else {
    //   print('lkjl');
    // }
    isLoading.value = true;
    var res = await client
        .get(kBaseUrl, 'note/', token: token)
        .catchError(handleError);
    notes = RxList<Note>.from(res.map((x) => Note.fromJson(x)));
    isLoading.value = false;
  }

  addNote(String token) async {
    BaseClient client = BaseClient();
    showLoading();
    var payload = {
      "title": titleC.text.toString().trim(),
      "description": descriptionC.text.toString().trim()
    };
    await client
        .post(kBaseUrl, 'note/', jsonEncode(payload), token: token)
        .catchError(handleError);
    hideLoading();
    getNotes(token);
  }

  updateNote(String token, int index) async {
    BaseClient client = BaseClient();
    showLoading();

    var payload = {
      "title": titleC.text.toString().trim(),
      "description": descriptionC.text.toString().trim()
    };
    var res = await client
        .update(kBaseUrl, 'note/${notes[index].id}', jsonEncode(payload), token)
        .catchError(handleError);
    hideLoading();
    getNotes(token);
  }

  deleteNote(String token, int index) async {
    BaseClient client = BaseClient();
    showLoading();
    var res = await client
        .delete(kBaseUrl, 'note/${notes[index].id}', token)
        .catchError(handleError);
    print(res);
    hideLoading();
    getNotes(token);
  }
}
