import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_app/models/note.dart';
import 'package:note_app/models/note_database.dart';
import 'package:provider/provider.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
//text controler to access what the user typed
  final textController = TextEditingController();
  @override
  void initState() {
    super.initState();
    readNotes();
  }

  void createNote() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: textController,
              ),
              actions: [
                MaterialButton(
                  onPressed: () {
                    context.read<NoteDatabase>().addNote(textController.text);
                    Navigator.pop(context);
                  },
                  child: const Text("Create"),
                )
              ],
            ));
  }
  //create a note

  void readNotes() {
    context.read<NoteDatabase>().fetchNotes();
  }
  //read a note

  //update a note

  //
  @override
  Widget build(BuildContext context) {
    // note database
    final noteDatabase = context.watch<NoteDatabase>();

    //current notes

    List<Note> currentNotes = noteDatabase.currentNotes;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Notes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: currentNotes.length,
          itemBuilder: ((context, index) {
            final note = currentNotes[index];

            //
            return ListTile(
              title: Text(note.text),
            );
          })),
    );
  }
}
