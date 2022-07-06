import 'package:flutter/material.dart';

class NoteCard extends StatefulWidget {
  final String title;
  final String description;
  final Color cardColor;
  final VoidCallback onDeleteNote;
  final VoidCallback onTap;
  const NoteCard({
    Key? key,
    required this.onDeleteNote,
    required this.onTap,
    required this.cardColor,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  bool longPressed = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onLongPress: () => longPressAction(true),
        onTap: widget.onTap,
        child: longPressed ? menu() : card());
  }

  longPressAction(bool action) {
    longPressed = action;
    setState(() {});
  }

  Widget card() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: widget.cardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          const SizedBox(height: 12),
          Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 20),
          Text(
            widget.description,
            overflow: TextOverflow.ellipsis,
            maxLines: 7,
          ),
        ]),
      ),
    );
  }

  Widget menu() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                icon: const Icon(
                  Icons.delete,
                  size: 32,
                  color: Colors.red,
                ),
                onPressed: () {
                  longPressAction(false);
                  widget.onDeleteNote();
                }),
            IconButton(
              icon: const Icon(
                Icons.cancel,
                size: 32,
                color: Colors.green,
              ),
              onPressed: () => longPressAction(false),
            ),
          ],
        ),
      ),
    );
  }
}
