import 'package:flutter/material.dart';
import 'async_operations.dart'; // 导入功能代码文件

class FutureBuilderPage extends StatelessWidget {
  const FutureBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('异步操作示例')),
      body: Center(
        child: FutureBuilder<String>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // 加载中
            } else if (snapshot.hasError) {
              return Text('错误：${snapshot.error}'); // 错误处理
            } else {
              return Text(snapshot.data ?? '无数据'); // 显示数据
            }
          },
        ),
      ),
    );
  }
}