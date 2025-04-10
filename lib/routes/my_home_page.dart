import 'package:flutter/material.dart';

import '../widgets/type_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    bool isNarrow = size.width < 500;

    var body = CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(widget.title),
          expandedHeight: 200,
          centerTitle: true,
          backgroundColor: theme.colorScheme.inversePrimary,
        ),
        SliverGrid(
          delegate: SliverChildListDelegate([
            TypeCard(type: PredefineTypes.stared),
            TypeCard(type: PredefineTypes.planned),
            TypeCard(type: PredefineTypes.tasks),
            TypeCard(type: PredefineTypes.today),
          ]),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: isNarrow ? 1.5 : 3,
          ),
        ),
      ],
    );
    var appTitle = DrawerHeader(
      decoration: BoxDecoration(color: theme.colorScheme.inversePrimary),
      child: Container(
        width: size.width,
        child: Text(widget.title),
        alignment: Alignment.center,
      ),
    );
    var navMenu = Container();
    var navTrailing = Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );

    var navBar = Container(
      child: Column(
        children: [appTitle, Expanded(child: navMenu), navTrailing],
      ),
    );

    var drawer = Drawer(child: navBar);

    return Scaffold(drawer: drawer, body: Center(child: body));
  }
}
