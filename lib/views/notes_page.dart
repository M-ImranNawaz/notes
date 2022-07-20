import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/constants.dart';
import 'package:notes/controllers/notes_controller.dart';
import 'package:notes/views/views.dart';

class NotesPage extends StatelessWidget {
  NotesPage({Key? key, required this.token, this.user}) : super(key: key);
  final String token;
  final user;
  final c = Get.put(NotesController());
  @override
  Widget build(BuildContext context) {
    c.getNotes(token);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String title = "Add";
          buildBottomSheet(context, title, token);
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Obx(() => c.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: c.notes.length,
                itemBuilder: (context, index) => ListTile(
                      title: Text(c.notes[index].title),
                      subtitle: Text(c.notes[index].description),
                      trailing: PopupMenuButton(
                          onSelected: (String value) {
                            value.contains('Edit')
                                ? buildBottomSheet(context, 'Update', token, index: index)
                                : c.deleteNote(token, index);
                          },
                          itemBuilder: (context) => [
                                const PopupMenuItem(
                                  value: 'Edit',
                                  child: Text('Edit'),
                                ),
                                const PopupMenuItem(
                                  value: 'Delete',
                                  child: Text('Delete'),
                                ),
                              ]),
                    ))),
      ),
    );
  }

  Future<dynamic> buildBottomSheet(
      BuildContext context, String title, String token, {int index =0}) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: Colors.transparent,
        builder: (context) => DraggableScrollableSheet(
            initialChildSize: 0.75, //set this as you want
            maxChildSize: 0.75, //set this as you want
            minChildSize: 0.75, //set this as you want
            expand: true,
            builder: (context, scrollController) => AddNotePage(
                  title: title,
                  token: token,
                  c: c,
                  index: index
                )));
  }
}
