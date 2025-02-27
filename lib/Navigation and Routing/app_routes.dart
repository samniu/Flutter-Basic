import 'package:flutter/material.dart';
// import 'first_page.dart'; // 导入 HomePage 文件
// import 'second_page.dart'; // 导入 SecondPage 文件
// import '../Animation/animated_container_page.dart'; // AnimatedContainer 示例页面
// import '../Animation/animation_controller_page.dart'; // AnimationController 示例页面
// import '../Animation/tween_animation_page.dart';
// import '../Animation/hero_animation_page.dart';
// import '../Animation/tap_scale_animation_page.dart';
// import '../network/network_page.dart';
// import '../SharedPreferences(local storage)/storage_page.dart';
// import '../State Management with Provider/provider_page.dart';
// import '../database/database_page.dart';
// import '../theme/theme_demo_page.dart';
import '../firebase/register_page.dart';
import '../firebase/login_page.dart';
import '../firebase/home_page.dart';
import '../firebase/auth_checker.dart';


class AppRoutes {
  // 动态获取初始页面
  static String getInitialRoute() {
    return AuthChecker.getInitialRoute();
  }  
  // 返回路由配置
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      // '/': (context) => HomePage(),
      // '/second': (context) => SecondPage(data: 'Hello from HomePage!'),

      //Animation
      // '/animatedContainer': (context) => AnimatedContainerPage(),
      // '/animationController': (context) => AnimationControllerPage(),
      // '/tweenAnimation': (context) => TweenAnimationPage(),
      // '/heroAnimation': (context) => HeroAnimationPage(),
      // '/tapScaleAnimation': (context) => TapScaleAnimationPage(),

      // Network
      // '/network': (context) => NetworkPage(),

      // Local storage with SharedPreferences
      // '/storage': (context) => StoragePage(),

      //State Management with Provider
      // '/provider': (context) => ProviderPage(),

      // database
      // '/database': (context) => DatabasePage(),

      // theme
      // '/themeDemo': (context) => ThemeDemoPage(),

      //firebase
      '/userhome': (context) => HomePage(),
      '/register': (context) => RegisterPage(),
      '/login': (context) => LoginPage(),
    };
  }

  // 返回 initialRoute 配置
  // static String getInitialRoute() {
  //   // return '/';
  //   // return '/animatedContainer'; // 设定动画页面为初始页面
  //   // return '/network';
  //   // return '/storage';
  //   // return '/provider';
  //   // return '/database';
  //   // return '/themeDemo';
  //   return '/register';
  // }
}
