import 'package:firebase_auth/firebase_auth.dart';

class AuthChecker {
  static String getInitialRoute() {
    User? user = FirebaseAuth.instance.currentUser;
    return user != null ? '/userhome' : '/register';
  }
}