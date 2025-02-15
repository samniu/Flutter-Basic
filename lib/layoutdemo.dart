import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container & Row & Column')
      ),
      body: Padding(
        padding: 
        EdgeInsets.all(16.0), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Container 示例
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(color: Colors.grey, blurRadius: 5, spreadRadius: 2)
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                '我是 Container',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            SizedBox(height: 20),  

            // 2. Row 水平布局
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(width: 50, height: 50, color: Colors.red),
                Container(width: 50, height: 50, color: Colors.green),
                Container(width: 50, height: 50, color: Colors.blue),
              ],
            ),
            SizedBox(height: 20),

            // 3. Column 垂直布局
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 100, height: 50, color: Colors.orange),
                SizedBox(height: 10),
                Container(width: 100, height: 50, color: Colors.purple),
                SizedBox(height: 10),
                Container(width: 100, height: 50, color: Colors.cyan),
              ],
            ),
            SizedBox(height: 20),

            // 4. Expanded 让子组件占满 Row
            Row(
              children: [
                Expanded(child: Container(height: 50, color: Colors.pink)),
                Expanded(child: Container(height: 50, color: Colors.yellow)),
              ],
            ),            
          ],
        ),
      ),
    );
  }
}
