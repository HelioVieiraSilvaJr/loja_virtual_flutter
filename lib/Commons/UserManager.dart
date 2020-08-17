import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:loja_virtual_flutter/Commons/Helpers/FirebaseErrors.dart';
import 'Model/User.dart';

class UserManager {

  UserManager() {
    _loadCurrentUser();
  }
  
  final _auth = FirebaseAuth.instance;

  FirebaseUser user;

  Future<void> singIn({User user, Function onSuccess, Function onFail}) async {
    try {
    final AuthResult result = await _auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password
    );
    onSuccess();

    } on PlatformException catch(e) {
      onFail(getErrorString(e.code));
    }
  }

  Future<void> _loadCurrentUser() async {
    final FirebaseUser user = await _auth.currentUser();
    if(user != null) {
      this.user = user;
      print(user.uid);
    }
  }
}