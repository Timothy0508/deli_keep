import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    bool isNarrowScreen = MediaQuery.of(context).size.width < 500;
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    var noteDisplay = Card(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(widget.title),
            expandedHeight: 200,
            centerTitle: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: theme.colorScheme.inversePrimary,
          ),
        ],
      ),
    );
    var appTitle = Container(
      width: size.width,
      height: 100,
      child: Text(widget.title),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: theme.colorScheme.inversePrimary,
        borderRadius: BorderRadius.circular(10),
      ),
    );

    var navBar = Card(child: Container(child: Column(children: [appTitle])));

    var drawer = Drawer(child: navBar);

    var body = Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(flex: 1, child: navBar),
        Expanded(flex: 5, child: noteDisplay),
      ],
    );

    return Scaffold(
      drawer: isNarrowScreen ? drawer : null,
      body: Center(child: isNarrowScreen ? noteDisplay : body),
    );
  }
}
