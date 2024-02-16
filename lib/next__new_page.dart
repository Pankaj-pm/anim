import 'package:flutter/material.dart';

class NextNewPage extends StatefulWidget {
  final int index;

  const NextNewPage({super.key, required this.index});

  @override
  State<NextNewPage> createState() => _NextNewPageState();
}

class _NextNewPageState extends State<NextNewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Hero(
        tag: widget.index,
        child: Container(
          width: double.infinity,
          height: 300,
          color: Colors.black12,
          child: Center(child: Text("Clicked on ${widget.index}")),

        ),
        // flightShuttleBuilder: (flightContext, animation, flightDirection, fromHeroContext, toHeroContext) => Text("bbbb")
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {},
      ),
    );
  }
}
