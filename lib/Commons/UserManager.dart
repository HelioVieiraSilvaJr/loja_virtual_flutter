import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:loja_virtual_flutter/Commons/Helpers/FirebaseErrors.dart';
import 'Model/User.dart';

class UserManager {

  UserManager() {
    _loadCurrentUser();
  }
  
  final _auth = FirebaseAuth.instance;
  final _db = Firestore.instance;

  User user;

  Future<void> singIn({User user, Function onSuccess, Function onFail}) async {
    try {
    final AuthResult result = await _auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password
    );
    await _loadCurrentUser(firebaseUser: result.user);
    onSuccess();

    } on PlatformException catch(e) {
      onFail(getErrorString(e.code));
    }
  }

  Future<void> signUp({User user, Function onSuccess, Function onFail}) async {
    try{
      final AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: user.email,
          password: user.password
      );
      user.id = result.user.uid;
      this.user = user;
      ///Salvando dados do usuário no Database.
      await _db.document('users/${user.id}').setData(user.toMap());
      
      onSuccess();

    } on PlatformException catch(e){
      onFail(getErrorString(e.code));
    }
  }

  Future<void> _loadCurrentUser({FirebaseUser firebaseUser}) async {
    final FirebaseUser currentUser = firebaseUser ?? await _auth.currentUser();
    if(currentUser != null) {
      final DocumentSnapshot docUser = await _db.document('users/${currentUser.uid}').get();
      user = User.fromDocument(docUser);
    }
  }
}