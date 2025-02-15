import 'package:flutter/material.dart';
import 'first_page.dart'; // 导入 HomePage 文件
import 'second_page.dart'; // 导入 SecondPage 文件

class AppRoutes {
  // 返回路由配置
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/': (context) => HomePage(),
      '/second': (context) => SecondPage(data: 'Hello from HomePage!'),
    };
  }

  // 返回 initialRoute 配置
  static String getInitialRoute() {
    return '/';
  }
}