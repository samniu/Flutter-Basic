import 'package:flutter/material.dart';
import 'second_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 页面跳转到 SecondPage
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => SecondPage(data: 'Hello from HomePage!')),
            // );
            
            // 使用命名路由跳转到 SecondPage
            Navigator.pushNamed(context, '/second');            
          },
          child: Text('Go to Second Page'),
        ),
      ),
    );
  }
}