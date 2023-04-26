import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/provider/notes_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddNewNotePage extends StatefulWidget {
  final bool isUpdate;
  final Note? note;
  const AddNewNotePage({Key? key, required this.isUpdate, this.note})
      : super(key: key);

  @override
  State<AddNewNotePage> createState() => _AddNewNotePageState();
}

class _AddNewNotePageState extends State<AddNewNotePage> {
  TextEditingController titleControler = TextEditingController();
  TextEditingController contentControler = TextEditingController();

  FocusNode noteFocus = FocusNode();

  void addNewNote() {
    Note newNote = Note(
        id: Uuid().v1(), // For unique id i install a package uuid
        userid: "sj",
        title: titleControler.text,
        content: contentControler.text,
        dateadded: DateTime.now());

    Provider.of<NotesProvider>(context, listen: false).addNote(newNote);
    Navigator.pop(context);
  }

  void updateNote() {
    widget.note!.title = titleControler.text;
    widget.note!.content = contentControler.text;
    widget.note!.dateadded = DateTime.now();
    Provider.of<NotesProvider>(context, listen: false).updateNote(widget.note!);
    Navigator.pop(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.isUpdate) {
      titleControler.text = widget.note!.title!;
      contentControler.text = widget.note!.content!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              if (widget.isUpdate) {
                updateNote();
              } else {
                addNewNote();
              }
            },
            icon: Icon(Icons.check),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              // .......................Title...........................................//
              TextField(
                controller: titleControler,
                autofocus: (widget.isUpdate == true) ? false : true,
                onSubmitted: (val) {
                  if (val != "") {
                    noteFocus.requestFocus();
                  }
                },
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  hintText: "Title",
                  border: InputBorder.none,
                ),
              ),

              //...............................................Content....................................//
              Expanded(
                child: TextField(
                  controller: contentControler,
                  focusNode: noteFocus,
                  maxLines: null,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    hintText: "Note",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
