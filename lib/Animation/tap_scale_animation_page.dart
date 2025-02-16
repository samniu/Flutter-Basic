import 'package:flutter/material.dart';

class TapScaleAnimationPage extends StatefulWidget {
  @override
  _TapScaleAnimationPageState createState() => _TapScaleAnimationPageState();
}

class _TapScaleAnimationPageState extends State<TapScaleAnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
      lowerBound: 1.0,
      upperBound: 1.5,
    );

    _scaleAnimation = _controller;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tap Scale Animation')),
      body: Center(
        child: GestureDetector(
          onTapDown: (_) => _controller.forward(),
          onTapUp: (_) => _controller.reverse(),
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}