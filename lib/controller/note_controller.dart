import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_note_app/models/note_model.dart';

class NoteController with ChangeNotifier {
  List<NoteModel> noteList = [
    NoteModel(title: "Make it note", description: "Dont lose your idea."),
  ];

  NoteController() {
    setColorForEachNote();
  }

  /*noteColorList variable for every note have a color.
  If some note deleted or rebuild, i dont want to notecolor is change */
  List<Color> noteColorList = [Colors.pink];

  bool addNote(NoteModel note) {
    try {
      noteList.add(note);
      setColorForEachNote();
      notifyListeners();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  deleteNote(int index) {
    try {
      noteList.removeAt(index);
      removeColorAt(index);
      notifyListeners();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  editNote(int index, NoteModel editedNote) {
    try {
      noteList[index] = editedNote;
      notifyListeners();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  printList() {
    debugPrint("Item count:${noteList.length}");
    for (NoteModel note in noteList) {
      debugPrint("Title: ${note.title}");
    }
  }

  setColorForEachNote() {
    if (noteColorList.length < noteList.length) {
      for (int i = noteColorList.length; i < noteList.length; i++) {
        noteColorList.add(randomColor());
      }
    }
  }

  removeColorAt(int index) {
    noteColorList.removeAt(index);
  }

  Color randomColor() {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }
}
