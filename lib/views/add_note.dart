import 'package:flutter/material.dart';
import 'package:flutter_note_app/controller/note_controller.dart';
import 'package:flutter_note_app/models/note_model.dart';
import 'package:provider/provider.dart';

class AddNote extends StatefulWidget {
  // TODO: look back for final
  //i checked for null states because i can pass the nullSafety
  final NoteModel? updateNote;
  final int index;
  final bool isUpdate;
  const AddNote({
    Key? key,
    required this.index,
    required this.isUpdate,
    required this.updateNote,
  }) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  late TextEditingController _titleController;
  late TextEditingController _descController;

  @override
  void initState() {
    if (widget.isUpdate) {
      _titleController = TextEditingController(text: widget.updateNote!.title);
      _descController =
          TextEditingController(text: widget.updateNote!.description);
    } else {
      _titleController = TextEditingController(text: "");
      _descController = TextEditingController(text: "");
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add note"),
        actions: [
          TextButton(
            onPressed: () => saveNote(),
            child: const Text(
              "Save",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          TextField(
            controller: _titleController,
            maxLines: null,
            decoration: const InputDecoration(
              label: Text("Note Title"),
              border: InputBorder.none,
            ),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: _descController,
            maxLines: null,
            decoration: const InputDecoration(
              label: Text("Note description"),
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }

  saveNote() {
    if (_titleController.text.isEmpty && _descController.text.isEmpty) {
      Navigator.pop(context, "not_saved");
    } else {
      if (widget.isUpdate) {
        // i can pass the nullSafety because i checking for null states.
        widget.updateNote!.title = _titleController.text;
        widget.updateNote!.description = _descController.text;

        bool isSuccess = Provider.of<NoteController>(context, listen: false)
            .editNote(widget.index, widget.updateNote!);
        if (isSuccess) {
          Navigator.pop(context);
        }
      } else {
        NoteModel newNote = NoteModel(
          title: _titleController.text,
          description: _descController.text,
        );

        bool isSuccess = Provider.of<NoteController>(context, listen: false)
            .addNote(newNote);
        if (isSuccess) {
          Navigator.pop(context);
        }
      }
    }
  }
}
