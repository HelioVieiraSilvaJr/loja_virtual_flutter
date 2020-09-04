import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:loja_virtual_flutter/Scenes/Product/Model/ItemSize.dart';

class Product {

  String id;
  String name;
  String description;
  String price;
  List<String> images = [];
  List<ItemSize> sizes = [];

  ItemSize _sizeSelected;

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
    if(data["sizes"] != null) {
      sizes = (data["sizes"] as List<dynamic> ?? []).map((size) => ItemSize.fromMap(size as Map<String, dynamic>)).toList();
    }
  }

  String getFirstImage() {
    if(images.length > 0) {
      return images.first;
    } else {
      return null;
    }
  }

  ItemSize get sizeSelected => _sizeSelected;

  set sizeSelected(ItemSize value) {
    _sizeSelected = value;

    sizes.forEach((element) {
      element.selected = element == value ? true : false;
    });
  }
}