import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:loja_virtual_flutter/Commons/Helpers/FirebaseErrors.dart';
import 'package:loja_virtual_flutter/Commons/Model/User.dart';
import 'package:loja_virtual_flutter/Commons/UserManager.dart';

class SignInViewModel {

  final _auth = FirebaseAuth.instance;
  final _db = Firestore.instance;

  SignInViewModel() {
    print("Contrutor -> SignInViewModel");
  }

  Future<void> singIn({User user, Function onSuccess, Function onFail}) async {
    print("Chamou SignIn");
    try {
      final AuthResult result = await _auth.signInWithEmailAndPassword(
          email: user.email,
          password: user.password
      );
      print("Fez signIn no Firebase -> ${result.user.uid}");
      await _loadCurrentUser(firebaseUser: result.user);
      onSuccess();

    } on PlatformException catch(e) {
      print("Deu Erro no SignIn");
      onFail(getErrorString(e.code));
    }
  }

  Future<void> _loadCurrentUser({FirebaseUser firebaseUser}) async {
    final FirebaseUser currentUser = firebaseUser ?? await _auth.currentUser();
    if(currentUser != null) {
      final DocumentSnapshot docUser = await _db.document('users/${currentUser.uid}').get();
      User user = User.fromDocument(docUser);
      UserManager.instance.initUser(user);
    }
  }
}