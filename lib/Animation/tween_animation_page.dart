import 'package:flutter/material.dart';

class TweenAnimationPage extends StatefulWidget {
  @override
  _TweenAnimationPageState createState() => _TweenAnimationPageState();
}

class _TweenAnimationPageState extends State<TweenAnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true); // 循环播放动画

    _sizeAnimation = Tween<double>(begin: 100, end: 200).animate(_controller);
    _colorAnimation =
        ColorTween(begin: Colors.blue, end: Colors.red).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tween Animation')),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Container(
              width: _sizeAnimation.value,
              height: _sizeAnimation.value,
              color: _colorAnimation.value,
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}