import 'package:flutter/material.dart';

class MyGridView extends StatelessWidget {
  final List<Color> colors = [
    Colors.red, Colors.blue, Colors.green, Colors.yellow, Colors.purple, Colors.orange
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 3 列
        crossAxisSpacing: 10, // 列间距
        mainAxisSpacing: 10, // 行间距
      ),
      itemCount: colors.length,
      itemBuilder: (context, index) {
        return Container(color: colors[index], height: 100);
      },
    );
  }
}