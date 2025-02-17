import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 注册用户并存储数据到 Firestore
  Future<void> registerUser(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(email: email, password: password);

      // 获取用户 ID
      String uid = userCredential.user!.uid;

      // 存储用户数据到 Firestore
      await _firestore.collection('users').doc(uid).set({
        'uid': uid,
        'email': email,
        'created_at': DateTime.now(), // 记录注册时间
      });

      print("用户注册成功：${userCredential.user!.email}");
    } catch (e) {
      print("注册失败：$e");
    }
  }

  // 登录用户，并更新 Firestore 里的用户信息
  Future<void> loginUser(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(email: email, password: password);

      String uid = userCredential.user!.uid;

      // 🔹 更新 Firestore 里的用户登录时间
      await _firestore.collection('users').doc(uid).set({
        'uid': uid,
        'email': email,
        'last_login': FieldValue.serverTimestamp(), // 记录最后登录时间
      }, SetOptions(merge: true)); // 只更新 `last_login`，不覆盖其他数据

      print("✅ 用户登录成功，数据已写入 Firestore");
    } catch (e) {
      print("❌ 登录失败：$e");
    }
  }

  //手动添加数据到Firestore
  Future<void> addUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      'name': "Flutter 用户",
      'age': 25,
      'joined_at': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));

    print("✅ 用户信息写入成功");
  }

  // 获取当前用户数据
  Future<Map<String, dynamic>?> getUserData() async {
    User? user = _auth.currentUser;
    if (user == null) return null;

    DocumentSnapshot userDoc = await _firestore.collection('users').doc(user.uid).get();
    return userDoc.exists ? userDoc.data() as Map<String, dynamic> : {'email': user.email};
  }

  // 获取当前用户 Firestore 数据的 Stream
  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserStream() {
    User? user = _auth.currentUser;
    if (user == null) {
      return const Stream.empty(); // 用户未登录，返回空流
    }
    return _firestore.collection('users').doc(user.uid).snapshots();
  }

  // 用户退出
  Future<void> logoutUser() async {
  await _auth.signOut();
  print("✅ 用户已退出");
}
}
