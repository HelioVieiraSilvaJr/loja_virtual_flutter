import 'dart:async';
import 'package:loja_virtual_flutter/Scenes/Product/Model/Product.dart';
import 'package:loja_virtual_flutter/Scenes/Product/Repository/ProductListRepository.dart';

class ProductListViewModel {

  final _repository = ProductListRepository();

  final controller = StreamController<bool>.broadcast();
  List<Product> products = [];

  Future<void> fetchProducts() async {

    Product product1 = new Product(
      name: "Camisa branca",
      description: "Camisa Branca de alta qualidade",
      images: [
        "http://primeira/imagem",
        "http://segunda/imagem"
      ]
    );
    Product product2 = new Product(
        name: "Camisa Amarela",
        description: "Camisa Amarela de alta qualidade",
        images: [
          "http://primeira/imagem",
          "http://segunda/imagem"
        ]
    );
    products.add(product1);
    products.add(product2);

    await Future.delayed(Duration(seconds: 3));
    controller.add(true);

    Product product3 = new Product(
        name: "Camisa Rosa",
        description: "Camisa Rosa de alta qualidade",
        images: [
          "http://primeira/imagem",
          "http://segunda/imagem"
        ]
    );
    Product product4 = new Product(
        name: "Camisa Verde",
        description: "Camisa Verde de alta qualidade",
        images: [
          "http://primeira/imagem",
          "http://segunda/imagem"
        ]
    );
    products.add(product3);
    products.add(product4);

    await Future.delayed(Duration(seconds: 3));
    controller.add(true);
  }
}