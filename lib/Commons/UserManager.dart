import 'package:firebase_auth/firebase_auth.dart';

import 'Model/User.dart';

class UserManager {

  UserManager._privateConstructor();

  static final UserManager instance = UserManager._privateConstructor();

  String uid;
  String name;
  String email;

  bool isLogged() {
    return uid != null;
  }

  void initUser(User user) {
    uid = user.id;
    name = user.name;
    email = user.email;
  }

  void logout() {
    FirebaseAuth.instance.signOut();
    uid = null;
    name = null;
    email = null;
  }
}