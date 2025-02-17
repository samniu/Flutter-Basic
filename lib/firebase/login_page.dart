import 'package:flutter/material.dart';
import 'auth_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("用户登录")),
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

                await _authService.loginUser(email, password);
                Map<String, dynamic>? userData = await _authService.getUserData();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("登录成功：${userData?['email']}")),
                );

                Navigator.pushNamed(context, '/userhome'); // 登录成功后跳转到主页
              },
              child: Text("登录"),
            ),
          ],
        ),
      ),
    );
  }
}
