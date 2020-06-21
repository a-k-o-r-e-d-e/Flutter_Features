import 'package:flutter/material.dart';

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
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, int index) {
            return Dismissible(
              key: Key(items[index]),
              onDismissed: (direction) {
                setState(() {
                  items.removeAt(index);
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text("Item Dismissed")));
                });
              },
              background: Container(
                color: Colors.red,
              ),
              child: ListTile(
                title: Text("${items[index]}"),
              ),
            );
          }),
    );
  }
}
