import 'package:flutter/material.dart';

import '../models/note.dart';
import '../widgets/add_note_dialog.dart';
import '../widgets/note_container.dart';

///The page for each categories
///
/// `const NotePage({
///     super.key,
///     required this.title,
///     required this.color,
///     required this.backgroundColor,
///     required this.icon,
///   });`
class NotePage extends StatefulWidget {
  final String title;

  final Color color;

  final Color backgroundColor;

  final Icon icon;

  final List<Note> notes;

  const NotePage({
    super.key,
    required this.title,
    required this.color,
    required this.backgroundColor,
    required this.icon,
    required this.notes,
  });

  @override
  State<StatefulWidget> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<Widget> notes = List.generate(
      widget.notes.length,
      (index) =>
          NoteContainer(note: widget.notes[index], themeColor: widget.color),
    );

    var appBar = SliverAppBar(
      title: Text(widget.title),
      backgroundColor:
          Theme.of(context)
              .copyWith(
                colorScheme: ColorScheme.fromSeed(seedColor: widget.color),
              )
              .colorScheme
              .inversePrimary,
      expandedHeight: 200,
      flexibleSpace: Container(
        alignment: Alignment.bottomLeft,
        margin: EdgeInsets.all(20),
        height: size.height,
        child: Row(
          spacing: 20,
          children: [
            Icon(widget.icon.icon, size: 40, color: widget.color),
            Text(
              widget.title,
              style: TextStyle(color: widget.color, fontSize: 40),
            ),
          ],
        ),
      ),
    );

    var notesShowcase = SliverList(delegate: SliverChildListDelegate(notes));

    var body = CustomScrollView(slivers: [appBar, notesShowcase]);

    return Theme(
      data: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: widget.color),
      ),
      child: Scaffold(
        body: body,
        floatingActionButton: FloatingActionButton(
          onPressed: () => showAddNoteDialog(context, widget.color),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
