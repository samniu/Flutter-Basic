import 'package:flutter/material.dart';
import 'auth_service.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("用户注册")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "邮箱"),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: "密码"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String email = _emailController.text.trim();
                String password = _passwordController.text.trim();
                await _authService.registerUser(email, password);
              },
              child: Text("注册"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login'); // 跳转到登录页
              },
              child: Text("已有账号？去登录"),
            ),
          ],
        ),
      ),
    );
  }
}