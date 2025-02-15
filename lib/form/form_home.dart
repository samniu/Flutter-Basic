import 'package:flutter/material.dart';
import 'my_form.dart'; // 导入 my_form.dart 文件

class FormHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Form Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: MyForm(), // 使用 MyForm 组件
      ),
    );
  }
}