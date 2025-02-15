import 'package:flutter/material.dart';
// import 'package:flutter_basic/layoutdemo.dart';
// import 'package:flutter_basic/home.dart';
// import 'widgets/home.dart';
// import 'counter_screen.dart';
import 'Navigation and Routing/app_routes.dart';
import 'form/form_home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Basic',
      // initialRoute: AppRoutes.getInitialRoute(), // 使用 AppRoutes 中的 initialRoute
      // routes: AppRoutes.getRoutes(), // 使用 AppRoutes 中的 routes 配置
      home: FormHome(),
    );
  }
}
