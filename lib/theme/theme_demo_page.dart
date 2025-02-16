import 'package:flutter/material.dart';

class ThemeDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Theme Demo')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('全局标题样式', style: Theme.of(context).textTheme.headlineLarge),
            SizedBox(height: 10),
            Text('这是 bodyMedium 样式文本', style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('自定义按钮样式'),
            ),
          ],
        ),
      ),
    );
  }
}