import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body:
      //Container(width: 200, height: 100, child: Text('Fluter 布局')),
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: <Widget>[
      //     Container(width: 200, height: 100, child: Text('Fluter 布局')),
      //     Container(width: 200, height: 100, child: Text('Fluter 布局')),
      //     Container(width: 200, height: 100, child: Text('Fluter 布局')),
      //   ],
      // ),
      // Stack(
      //   children: [
      //     Container(width: 100, height: 100, color: Colors.blue),
      //     Positioned(top: 10, left: 10, child: Text('叠加文本')),
      //   ],
      // ),
      // Row(
      //   children: [
      //     Expanded(child: Container(color: Colors.red, height: 50)),
      //     Expanded(child: Container(color: Colors.blue, height: 50)),
      //   ],
      // ),
      // Wrap(
      //   spacing: 10, // 横向间距
      //   runSpacing: 10, // 纵向间距
      //   children: List.generate(5, (index) => Chip(label: Text('标签 $index'))),
      // ),
      // ListView(
      //   children: List.generate(
      //     20,
      //     (index) => ListTile(title: Text('Item $index')),
      //   ),
      // ),
      // Padding(
      //   padding: EdgeInsets.all(20), // 四边填充 20 像素
      //   child: Text('Padding 示例'),
      // ),
      // Padding(
      //   padding: EdgeInsets.only(left: 10, top: 20), // 仅左侧 10px，顶部 20px
      //   child: Text('仅左侧和顶部有 padding'),
      // ),
      // Container(
      //   color: Colors.blue,
      //   child: Padding(
      //     padding: EdgeInsets.all(50), // 让 Text 和 Container 边缘有间距
      //     child: Text('带 padding 的文本', style: TextStyle(color: Colors.white)),
      //   ),
      // ),
      // Column(
      //   children: [
      //     Padding(padding: EdgeInsets.all(8), child: Text('第一个文本')),
      //     Padding(padding: EdgeInsets.all(14), child: Text('第二个文本')),
      //   ],
      // ),
      ListView(
        padding: EdgeInsets.all(20), // 给整个 ListView 设置 padding
        children: [
          Text('列表项 1'),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text('列表项 2（有上下间距）'),
          ),
          Text('列表项 3'),
        ],
      ),
    );
  }
}
