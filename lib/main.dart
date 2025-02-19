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
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'Provider/auth_provider.dart';

void main() async {
  await dotenv.load(); // 加载 .env 文件
  WidgetsFlutterBinding.ensureInitialized(); // 确保 Flutter 绑定初始化

  // 初始化 Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ), // 添加 AuthProvider
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
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
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
