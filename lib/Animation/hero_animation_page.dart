import 'package:flutter/material.dart';

class HeroAnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hero Animation')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HeroDetailPage()),
            );
          },
          child: Hero(
            tag: 'hero-image',
            child: Image.network(
              'https://picsum.photos/200',
              width: 100,
            ),
          ),
        ),
      ),
    );
  }
}

class HeroDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hero Detail')),
      body: Center(
        child: Hero(
          tag: 'hero-image',
          child: Image.network(
            'https://picsum.photos/400',
            width: 300,
          ),
        ),
      ),
    );
  }
}