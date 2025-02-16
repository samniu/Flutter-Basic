import 'package:flutter/material.dart';
// import 'first_page.dart'; // 导入 HomePage 文件
// import 'second_page.dart'; // 导入 SecondPage 文件
import '../Animation/animated_container_page.dart'; // AnimatedContainer 示例页面
import '../Animation/animation_controller_page.dart'; // AnimationController 示例页面

class AppRoutes {
  // 返回路由配置
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      // '/': (context) => HomePage(),
      // '/second': (context) => SecondPage(data: 'Hello from HomePage!'),
      '/animatedContainer': (context) => AnimatedContainerPage(),
      '/animationController': (context) => AnimationControllerPage(),
    };
  }

  // 返回 initialRoute 配置
  static String getInitialRoute() {
    // return '/';
    return '/animatedContainer'; // 设定动画页面为初始页面
  }
}