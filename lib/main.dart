import 'package:flutter/material.dart';
// import 'package:flutter_basic/layoutdemo.dart';
// import 'package:flutter_basic/home.dart';
// import 'widgets/home.dart';
import 'counter_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Basic',
      theme: ThemeData(primarySwatch: Colors.green),
      home: CounterScreen(),
    );
  }
}
