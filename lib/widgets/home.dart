import 'package:flutter/material.dart';
import 'my_listview.dart';
import 'my_gridview.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showListView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListView & GridView 示例")),
      body: showListView ? MyListView() : MyGridView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            showListView = !showListView;
          });
        },
        child: Icon(showListView ? Icons.grid_on : Icons.list),
      ),
    );
  }
}