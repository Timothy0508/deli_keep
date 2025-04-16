import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(
      context,
    ).copyWith(colorScheme: ColorScheme.fromSeed(seedColor: widget.color));
    var body = Theme(
      data: theme,
      child: AlertDialog(
        content: Text('test'),
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
