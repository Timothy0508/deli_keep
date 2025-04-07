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
    var size = MediaQuery.of(context).size;
    var drawer = Drawer();
    return Scaffold(
      drawer: drawer,
      body: Center(
        child: Card(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text(widget.title),
                expandedHeight: 200,
                centerTitle: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
