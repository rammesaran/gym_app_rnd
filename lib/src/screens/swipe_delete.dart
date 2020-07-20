import 'package:flutter/material.dart';

class SwipeDismiss extends StatefulWidget {
  @override
  _SwipeDismissState createState() => _SwipeDismissState();
}

class _SwipeDismissState extends State<SwipeDismiss> {
  final List<String> values = [
    "Inducesmile.com",
    "Flutter Dev",
    "Android Dev",
    "iOS Dev!",
    "React Native Dev!",
    "React Dev!",
    "express Dev!",
    "Laravel Dev!",
    "Angular Dev!",
    "Adonis Dev!",
    "Next.js Dev!",
    "Node.js Dev!",
    "Vue.js Dev!",
    "Java Dev!",
    "C# Dev!",
    "C++ Dev!",
  ];

  ScrollController controller = ScrollController();
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        loadMore();
      }
    });
  }

  loadMore() {
    setState(() {
      values..addAll(List<String>.from(values));
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swipe to delete'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: values.length,
          controller: controller,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('The value of ${values[index]}'),
            );
          },
        ),
      ),
    );
  }
}
