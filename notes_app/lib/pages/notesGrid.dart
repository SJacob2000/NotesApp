import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/pages/add_new_note.dart';
import 'package:notes_app/provider/notes_provider.dart';
import 'package:provider/provider.dart';

import '../models/note.dart';

class NotesGrid extends StatefulWidget {
  const NotesGrid({Key? key}) : super(key: key);

  @override
  State<NotesGrid> createState() => _NotesGridState();
}

class _NotesGridState extends State<NotesGrid> {
  @override
  Widget build(BuildContext context) {
    NotesProvider notesProvider = Provider.of<NotesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Notes App"),
        centerTitle: true,
      ),
      body: (notesProvider.isLoading == false)
          ? SafeArea(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: notesProvider.notes.length,
                itemBuilder: (context, index) {
                  Note currentNote = notesProvider.notes[index];

                  return GestureDetector(
                    onTap: () {
                      //....................... Update note...........................//
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => AddNewNotePage(
                            isUpdate: true,
                            note: currentNote,
                          ),
                        ),
                      );
                    },

                    //..................... Delete Note..............................//
                    onLongPress: () {
                      notesProvider.deleteNote(currentNote);
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey,
                            width: 2,
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentNote.title!,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          // const SizedBox(
                          //   height: 7,
                          // ),
                          Text(
                            currentNote.content!,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                            ),
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const AddNewNotePage(
                isUpdate: false,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
