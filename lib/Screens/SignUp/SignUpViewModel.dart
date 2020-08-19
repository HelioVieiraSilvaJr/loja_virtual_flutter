import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:loja_virtual_flutter/Commons/Helpers/FirebaseErrors.dart';
import 'package:loja_virtual_flutter/Commons/Model/User.dart';
import 'package:loja_virtual_flutter/Commons/UserManager.dart';

class SignUpViewModel {

  final _auth = FirebaseAuth.instance;
  final _db = Firestore.instance;

  Future<void> signUp({User user, Function onSuccess, Function onFail}) async {
    try{
      final AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: user.email,
          password: user.password
      );
      user.id = result.user.uid;

      ///Salvando dados do usuário no Database.
      await _db.document('users/${user.id}').setData(user.toMap());

      UserManager.instance.initUser(user);
      onSuccess();

    } on PlatformException catch(e){
      onFail(getErrorString(e.code));
    }
  }
}