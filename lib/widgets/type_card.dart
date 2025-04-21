import 'package:flutter/material.dart';

import '../models/note.dart';
import '../routes/note_page.dart';

///The enum for each types.
///
///Including: `stared`, `today`, `planned`, `tasks`
enum PredefineTypes {
  stared(
    icon: Icon(Icons.star_rounded, color: Colors.deepOrange),
    title: 'Starred',
    color: Colors.deepOrange,
    backgroundColor: Colors.orangeAccent,
  ),
  today(
    icon: Icon(Icons.today, color: Colors.blue),
    title: 'Today',
    color: Colors.blue,
    backgroundColor: Colors.lightBlueAccent,
  ),
  planned(
    icon: Icon(Icons.calendar_month, color: Colors.green),
    title: 'Planned',
    color: Colors.green,
    backgroundColor: Colors.lightGreenAccent,
  ),
  tasks(
    icon: Icon(Icons.home_rounded, color: Colors.purple),
    title: 'Tasks',
    color: Colors.purple,
    backgroundColor: Colors.purpleAccent,
  );

  final Icon icon;

  final String title;

  final Color color;

  final Color backgroundColor;

  const PredefineTypes({
    required this.icon,
    required this.title,
    required this.color,
    required this.backgroundColor,
  });
}

///The pressable navigation widgets
///
/// `const TypeCard({super.key, required this.type});`
class TypeCard extends StatefulWidget {
  final PredefineTypes type;

  const TypeCard({super.key, required this.type});

  @override
  State<StatefulWidget> createState() => _TypeCardState();
}

class _TypeCardState extends State<TypeCard> {
  @override
  Widget build(BuildContext context) {
    Icon icon = widget.type.icon;
    Text title = Text(
      widget.type.title,
      style: TextStyle(color: widget.type.color),
    );

    var body = Card(
      surfaceTintColor: widget.type.backgroundColor,
      child: InkWell(
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => NotePage(
                      title: widget.type.title,
                      color: widget.type.color,
                      backgroundColor: widget.type.backgroundColor,
                      icon: widget.type.icon,
                      notes: [Note(id: '1', title: 'iii', body: 'ijij')],
                    ),
              ),
            ),
        borderRadius: BorderRadius.circular(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [icon, title],
        ),
      ),
    );

    return body;
  }
}
