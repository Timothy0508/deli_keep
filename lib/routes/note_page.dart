import 'package:flutter/material.dart';

class NotePage extends StatefulWidget {
  final String title;

  final Color color;

  final Color backgroundColor;

  final Icon icon;

  const NotePage({
    super.key,
    required this.title,
    required this.color,
    required this.backgroundColor,
    required this.icon,
  });

  @override
  State<StatefulWidget> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    var body = CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(widget.title, style: TextStyle(color: widget.color)),
          leading: widget.icon,
          backgroundColor: widget.backgroundColor,
          expandedHeight: 200,
        ),
      ],
    );

    return Scaffold(body: body);
  }
}
