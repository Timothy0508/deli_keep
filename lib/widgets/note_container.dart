import 'package:flutter/material.dart';

import '../models/note.dart';

class NoteContainer extends StatefulWidget {
  final Note note;
  final Color themeColor;

  const NoteContainer({
    super.key,
    required this.note,
    required this.themeColor,
  });

  @override
  State<StatefulWidget> createState() => _NoteContainerState();
}

class _NoteContainerState extends State<NoteContainer> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(
      context,
    ).copyWith(colorScheme: ColorScheme.fromSeed(seedColor: widget.themeColor));
    return Theme(
      data: theme,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        child: Card(
          child: Row(
            children: [Text(widget.note.title), Text(widget.note.body)],
          ),
        ),
      ),
    );
  }
}
