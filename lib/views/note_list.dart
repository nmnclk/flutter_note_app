import 'package:flutter/material.dart';
import 'package:flutter_note_app/controller/note_controller.dart';
import 'package:flutter_note_app/views/add_note.dart';
import 'package:flutter_note_app/widgets/note_card.dart';
import 'package:provider/provider.dart';

class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  @override
  Widget build(BuildContext context) {
    //Provider.of<NoteController>(context).printList();
    // debugPrint("Optimized reBuild");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigateToAddPage(),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Note List'),
      ),
      body: Consumer<NoteController>(
        //Witout reBuild build widget shows changes at list
        builder: (context, value, child) => showList(context, value, child),
      ),
    );
  }

  Widget showList(context, value, child) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: value.noteList.length,
      itemBuilder: (context, index) => NoteCard(
        onTap: () => onTabNote(index),
        onDeleteNote: () => onDeleteNote(index),
        cardColor: value.noteColorList[index],
        title: value.noteList[index].title,
        description: value.noteList[index].description,
      ),
    );
  }

  onDeleteNote(int index) {
    debugPrint("deleted note at $index");
    Provider.of<NoteController>(context, listen: false).deleteNote(index);
  }

  onTabNote(int index) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (contex) => AddNote(
          isUpdate: true,
          updateNote: Provider.of<NoteController>(context, listen: false)
              .noteList[index],
          index: index,
        ),
      ),
    );
    if (result == "not_saved") {
      notSaved();
    }
  }

  navigateToAddPage() async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (contex) => const AddNote(
          isUpdate: false,
          updateNote: null,
          index: 0,
        ),
      ),
    );
    if (result == "not_saved") {
      notSaved();
    }
  }

  notSaved() {
    debugPrint("not saved");

    const snackBar = SnackBar(
      content: Text(
        'Note not saved!',
        style: TextStyle(fontSize: 16),
      ),
      duration: Duration(seconds: 1),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
