import 'package:flutter/material.dart';

import '../Utils/drawer_util.dart';

class SwipeToDismiss extends StatefulWidget {
  @override
  _SwipeToDismissState createState() => _SwipeToDismissState();
}

class _SwipeToDismissState extends State<SwipeToDismiss> {
  final List<String> items = List<String>.generate(30, (i) => "Items ${i + 1}");

  @override
  Widget build(BuildContext context) {
    // This widget is the root of view
    return Scaffold(
      appBar: AppBar(
        title: Text("Swipe to Dismiss"),
      ),
      drawer: DrawerUtil(),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, int index) {
            return Dismissible(
              key: Key(items[index]),
              onDismissed: (direction) {
                setState(() {
                  items.removeAt(index);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("Item Dismissed")));
                });
              },
              background: Container(
                color: Colors.red,
                child: Icon(Icons.delete_forever_outlined),
              ),
              child: ListTile(
                title: Text("${items[index]}"),
              ),
            );
          }),
    );
  }
}
