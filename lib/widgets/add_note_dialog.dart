import 'package:flutter/material.dart';

///To show dialog to add new note
///
/// `showAddNoteDialog(BuildContext context, Color color)`
showAddNoteDialog(BuildContext context, Color color) {
  showDialog(
    context: context,
    builder: (context) => AddNoteDialog(color: color),
  );
}

class AddNoteDialog extends StatefulWidget {
  final Color color;

  const AddNoteDialog({super.key, required this.color});

  @override
  State<StatefulWidget> createState() => _AddNoteDialogState();
}

class _AddNoteDialogState extends State<AddNoteDialog> {
  final _noteTitleController = TextEditingController();
  final _noteBodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context).copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: widget.color),
      textSelectionTheme: TextSelectionThemeData(cursorColor: widget.color),
    );
    var titleField = TextField(
      controller: _noteTitleController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide.none),
        hintText: 'Enter title',
      ),
    );
    var bodyField = TextField(
      controller: _noteBodyController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide.none),
        hintText: 'Enter body',
      ),
    );
    var body = Theme(
      data: theme,
      child: AlertDialog(
        content: Column(children: [titleField, Divider(), bodyField]),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Exit'),
          ),
        ],
      ),
    );
    return body;
  }
}
