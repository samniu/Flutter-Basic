import 'dart:async';

// 异步获取数据的函数
Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2)); // 模拟网络请求延时
  return '数据加载完成';
}

// 生成一系列数字的 Stream
Stream<int> generateNumbers() async* {
  for (int i = 0; i < 10; i++) {
    await Future.delayed(Duration(seconds: 1)); // 模拟延时
    yield i;
  }
}