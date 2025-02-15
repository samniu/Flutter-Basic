import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 返回到前一个页面
            Navigator.pop(context);
          },
          child: Text('Back to First Page'),
        ),
      ),
    );
  }
}