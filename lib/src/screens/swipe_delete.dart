import 'package:flutter/material.dart';
import 'package:gym_rnd/src/screens/alert_dialog.dart';

class SwipeDismiss extends StatefulWidget {
  @override
  _SwipeDismissState createState() => _SwipeDismissState();
}

class _SwipeDismissState extends State<SwipeDismiss> {
  final List<String> values =
      List<String>.generate(10, (index) => "value of $index");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swipe to delete'),
      ),
      body: ListView.builder(
          itemCount: values.length,
          itemBuilder: (context, index) {
            return Dismissible(
              background: Container(
                color: Colors.red,
                padding: EdgeInsets.only(left: 16.0),
                child: Align(
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
              //key identifies the unqiue value
              key: ValueKey(index),
              //key: Key(index.toString()),
              //direction based on the user interaction either left to right or vice versa
              direction: DismissDirection.startToEnd,
              onDismissed: (dismisDirection) {},
              confirmDismiss: (dismissDirection) async {
                final result = await showDialog(
                  context: (context),
                  builder: (context) => DeletePopup(),
                );
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$index is deleted'),
                  ),
                );
                return result;
              },
              child: ListTile(
                title: Center(child: Text("Hi this is $index")),
              ),
            );
          }),
    );
  }
}
