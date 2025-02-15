import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  final List<String> items = ["苹果", "香蕉", "橙子", "西瓜", "葡萄"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.fastfood),
          title: Text(items[index]),
        );
      },
    );
  }
}