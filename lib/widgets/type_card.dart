import 'package:flutter/material.dart';

enum PredefineTypes {
  stared(
    icon: Icon(Icons.star_rounded, color: Colors.deepOrange),
    title: 'Starred',
    color: Colors.deepOrange,
  ),
  today(
    icon: Icon(Icons.today, color: Colors.blue),
    title: 'Today',
    color: Colors.blue,
  ),
  planned(
    icon: Icon(Icons.calendar_month, color: Colors.green),
    title: 'Planned',
    color: Colors.green,
  ),
  tasks(
    icon: Icon(Icons.home_rounded, color: Colors.purple),
    title: 'Tasks',
    color: Colors.purple,
  );

  final Icon icon;

  final String title;

  final dynamic color;

  const PredefineTypes({
    required this.icon,
    required this.title,
    required this.color,
  });
}

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
      child: Container(
        child: Row(
          children: [icon, title],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
      ),
    );

    return body;
  }
}
