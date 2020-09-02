import 'package:cloud_firestore/cloud_firestore.dart';

class Product {

  String id;
  String name;
  String description;
  String price;
  List<String> images = [];

  Product({this.name, this.description, this.price, this.images});

  Product.fromDocument(DocumentSnapshot snapshot){
    final data = snapshot.data;
    id = snapshot.documentID;
    name = data["name"] as String;
    description = data["description"] as String;
    price = data["price"] as String;
    if(data["images"] != null) {
      images = List<String>.from(data["images"] as List<dynamic>);
    }
  }

  String getFirstImage() {
    if(images.length > 0) {
      return images.first;
    } else {
      return null;
    }
  }
}