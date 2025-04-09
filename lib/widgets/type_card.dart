import 'package:flutter/material.dart';

enum PredefineTypes {
  stared(icon: Icon(Icons.star_border_outlined), title: 'Starred'),
  today(icon: Icon(Icons.today_outlined), title: 'Today'),
  planned(icon: Icon(Icons.calendar_month_outlined), title: 'Planned'),
  tasks(icon: Icon(Icons.home_outlined), title: 'Tasks');

  final Icon icon;

  final String title;

  const PredefineTypes({required this.icon, required this.title});
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
    Text title = Text(widget.type.title);

    var body = Card(child: Container(child: Row(children: [icon, title])));

    return body;
  }
}
