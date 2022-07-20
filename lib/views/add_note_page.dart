import 'package:flutter/material.dart';
import '../controllers/notes_controller.dart';
import 'views.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage(
      {Key? key,
      required this.title,
      required this.c,
      required this.token,
      this.index = 0})
      : super(key: key);
  final String title;
  final String token;
  final int index;
  final NotesController c;
  @override
  Widget build(BuildContext context) {
    if (title.contains('Update')) {
      c.titleC.text = c.notes[index].title;
      c.descriptionC.text = c.notes[index].description;
    }
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$title Note',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormFieldWidget(
              controller: c.titleC,
              icon: Icons.title,
              label: 'Title',
              validator: () {},
            ),
            TextFormFieldWidget(
              icon: Icons.description,
              label: 'Description',
              validator: (value) {},
              controller: c.descriptionC,
            ),
            ButtonWidget(
                onPressed: () async {
                  title.contains('Add')
                      ? await c.addNote(token)
                      : await c.updateNote(token, index);
                  Navigator.pop(context);
                },
                title: '$title Note')
          ],
        ),
      ),
    );
  }
}
