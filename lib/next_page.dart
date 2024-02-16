import 'package:anim/next__new_page.dart';
import 'package:flutter/material.dart';

class NextPage extends StatefulWidget {
  const NextPage({super.key});

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NextNewPage(index: index),
                  ));
            },
            child: Hero(
              tag: index,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Index $index'),
                ),
              ),
              flightShuttleBuilder: (flightContext, animation, flightDirection, fromHeroContext, toHeroContext) {
                return  Text("okok",style: Theme.of(context).textTheme.bodyMedium,);
              },
            ),
          );
        },
        itemCount: 10,
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {},
      ),
    );
  }
}
