import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _authService = AuthService();
  String userEmail = "未登录";

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    Map<String, dynamic>? userData = await _authService.getUserData();
    setState(() {
      userEmail = userData?['email'] ?? "未登录";
    });
  }

  Future<void> _logout() async {
    await _authService.logoutUser();
    Navigator.pushReplacementNamed(context, '/login'); // 退出后回到登录页
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("主页"),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: _logout, // 退出按钮
          ),
        ],        
        ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: _authService.getUserStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("加载中...");
                }
                if (!snapshot.hasData || snapshot.data == null || !snapshot.data!.exists) {
                  return Text("用户数据不存在");
                }
                var userData = snapshot.data!.data();
                return Text("当前用户：${userData?['email'] ?? '未知'}");
              },
            ),           
            
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _authService.addUserData();
              },
              child: Text("写入用户信息"),
            ),
                        
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _logout,
              child: Text("退出登录"),
            ),
          ],
        ),
      ),
    );
  }
}
