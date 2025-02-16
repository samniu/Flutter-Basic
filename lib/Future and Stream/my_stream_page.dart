import 'package:flutter/material.dart';
import 'async_operations.dart'; // 导入功能代码文件

class MyStreamPage extends StatelessWidget {
  const MyStreamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stream 示例')),
      body: StreamBuilder<int>(
        stream: generateNumbers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // 加载中
          } else if (snapshot.hasError) {
            return Text('错误：${snapshot.error}'); // 错误处理
          } else {
            return Text('当前数字: ${snapshot.data}'); // 显示数据
          }
        },
      ),
    );
  }
}