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
    var size = MediaQuery.of(context).size;

    var body = CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(widget.title),
          backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
          expandedHeight: 200,
          iconTheme: IconThemeData(size: 40),
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
        ),
      ],
    );

    return Scaffold(body: body);
  }
}
