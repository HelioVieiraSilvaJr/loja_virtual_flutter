import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:loja_virtual_flutter/Commons/Helpers/FirebaseErrors.dart';
import 'package:loja_virtual_flutter/Scenes/Product/Model/Product.dart';

class ProductListRepository {

  Firestore _db = Firestore.instance;
  List<DocumentSnapshot> documentSnapshot = List<DocumentSnapshot>();

  Future<void> getProducts({void onSuccess(List<Product> product), void onFail(String error)}) async {
    documentSnapshot = [];
    try{
      print("==> Pegar snapshots");

      final QuerySnapshot snapshot = await _db
          .collection("products")
          .limit(10)
          .getDocuments();

      documentSnapshot.addAll(snapshot.documents);
      List<Product> products = List<Product>();
      for(DocumentSnapshot document in snapshot.documents) {
        products.add(Product.fromDocument(document));
      }
      onSuccess(products);

    } on PlatformException catch(e) {
      onFail(getErrorString(e.code));
    }
  }

  Future<void> getNextProducts({void onSuccess(List<Product> product), void onFail(String error)}) async {
    try{
      final QuerySnapshot snapshot = await _db
          .collection("products")
          .startAfterDocument(documentSnapshot[documentSnapshot.length - 1])
          .limit(10)
          .getDocuments();

      documentSnapshot.addAll(snapshot.documents);
      List<Product> products = List<Product>();
      for(DocumentSnapshot document in snapshot.documents) {
        products.add(Product.fromDocument(document));
      }
      onSuccess(products);

    } on PlatformException catch(e) {
      onFail(getErrorString(e.code));
    }
  }
}