import 'package:anim/anim.dart';
import 'package:anim/next_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isDone = false;
  bool isDart = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.black12,
            child: AspectRatio(
              aspectRatio: 1,
              child: Column(
                children: [
                  Row(
                    children: [
                      Draggable(
                        childWhenDragging: Text(""),
                        child: Container(
                          child: Text("Flutter"),
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
                        ),
                        feedback: Container(
                          child: Text(
                            "Flutter",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
                        ),
                        data: "Flutter",
                      ),
                      Draggable(
                        child: Container(
                          child: Text("Dart"),
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
                        ),
                        feedback: Container(
                          child: Text(
                            "Dart",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
                        ),
                        data: "Dart",
                      ),
                    ],
                  ),
                  LongPressDraggable(
                    child: Container(
                      child: Text("HELLO"),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
                    ),
                    feedback: Container(
                      child: Text(
                        "HELLO",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DragTarget(
                        onAccept: (data) {
                          if (data == "Dart") {
                            isDart = true;
                          }
                          print("onAccept $data ");
                        },
                        onLeave: (data) {
                          print("onLeave $data ");
                        },
                        onWillAccept: (data) {
                          return (data == "Dart");
                        },
                        builder: (context, candidateData, rejectedData) {
                          return Container(
                            color: Colors.black12,
                            height: 150,
                            width: 150,
                            child: isDart
                                ? Center(
                                    child: Container(
                                      child: Text(
                                        "Dart Done",
                                        style: Theme.of(context).textTheme.bodyMedium,
                                      ),
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.all(10),
                                      decoration:
                                          BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
                                    ),
                                  )
                                : Text("Dart"),
                          );
                        },
                      ),
                      DragTarget(
                        onAccept: (data) {
                          if (data == "Flutter") {
                            isDone = true;
                          }
                          print("onAccept $data ");
                        },
                        onLeave: (data) {
                          print("onLeave $data ");
                        },
                        onWillAccept: (data) {
                          return (data == "Flutter");
                        },
                        builder: (context, candidateData, rejectedData) {
                          return Container(
                            color: Colors.black12,
                            height: 150,
                            width: 150,
                            child: isDone
                                ? Center(
                                    child: Container(
                                      child: Text(
                                        "HELLO",
                                        style: Theme.of(context).textTheme.bodyMedium,
                                      ),
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.all(10),
                                      decoration:
                                          BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
                                    ),
                                  )
                                : Text("Flutter"),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Animated();
                },
              ));
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          Hero(
            tag: "btn",
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return NextPage();
                    },
                  ));
                },
                child: Text("Login")),
            placeholderBuilder: (context, heroSize, child) {
              return child;
            },
            flightShuttleBuilder: (flightContext, animation, flightDirection, fromHeroContext, toHeroContext) {
              return Icon(Icons.flight_takeoff);
            },
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(context, MaterialPageRoute(
      //       builder: (context) {
      //         return NextPage();
      //       },
      //     ));
      //   },
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
