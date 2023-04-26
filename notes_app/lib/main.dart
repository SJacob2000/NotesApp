import 'package:flutter/material.dart';
import 'package:notes_app/provider/notes_provider.dart';
import 'package:provider/provider.dart';

import 'pages/notesGrid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NotesProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NotesGrid(),
      ),
    );
  }
}
