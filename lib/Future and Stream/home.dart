import 'package:flutter/material.dart';
import 'future_builder_page.dart';
import 'my_stream_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // 2个标签页
      child: Scaffold(
        appBar: AppBar(
          title: Text('异步操作示例'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'FutureBuilder'),
              Tab(text: 'StreamBuilder'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FutureBuilderPage(), // FutureBuilderPage 页面
            MyStreamPage(), // MyStreamPage 页面
          ],
        ),
      ),
    );
  }
}