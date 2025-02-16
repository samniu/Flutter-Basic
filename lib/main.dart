import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'package:flutter_basic/layoutdemo.dart';
// import 'package:flutter_basic/home.dart';
// import 'widgets/home.dart';
// import 'counter_screen.dart';
import 'Navigation and Routing/app_routes.dart';
// import 'form/form_home.dart';
// import 'Future and Stream/home.dart';
import 'State Management with Provider/counter_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
      ],
      child: MainApp(),
    ),    
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Basic',
      theme: ThemeData(
        primarySwatch: Colors.blue, // 主题色
        textTheme: TextTheme(
          headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blue),
          bodyMedium: TextStyle(fontSize: 18, color: Colors.black87),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
        ),
      ),      
      initialRoute: AppRoutes.getInitialRoute(), // 使用 AppRoutes 中的 initialRoute
      routes: AppRoutes.getRoutes(), // 使用 AppRoutes 中的 routes 配置
      // home: HomePage(),
    );
  }
}
