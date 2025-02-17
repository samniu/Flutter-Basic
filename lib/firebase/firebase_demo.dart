import 'package:firebase_auth/firebase_auth.dart';

Future<void> registerUser(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    print("用户注册成功：${userCredential.user!.email}");
  } catch (e) {
    print("注册失败：$e");
  }
}

Future<void> loginUser(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    print("用户登录成功：${userCredential.user!.email}");
  } catch (e) {
    print("登录失败：$e");
  }
}