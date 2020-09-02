import 'dart:async';
import 'package:loja_virtual_flutter/Scenes/Product/Model/Product.dart';
import 'package:loja_virtual_flutter/Scenes/Product/Repository/ProductListRepository.dart';

class ProductListViewModel {

  final _repository = ProductListRepository();

  final controller = StreamController<bool>.broadcast();
  List<Product> products = [];
  int productsLength = 0;
  bool _canNewRequest = true;
  String _search = "";

  String get search => _search;
  set search(String value) {
    _search = value;
    fetchProducts();
  }

  Future<void> fetchProducts() async {
      print("==> fetchProducts: $_search");
      await _repository.getProducts(
          search: _search,
          onSuccess: (newProducts) {
            print("==> newProducts: $newProducts");
            products = newProducts;
            productsLength = newProducts.length;
            controller.add(true);
          },
          onFail: (error) {
            print("==> Error: $error");
            controller.add(false);
          }
      );
  }

  Future<void> fetchNextProducts() async {
    if(_canNewRequest) {
      _canNewRequest = false;
      await _repository.getNextProducts(
          onSuccess: (newProducts) {
            products.addAll(newProducts);
            productsLength = products.length;
            _canNewRequest = true;
            controller.add(true);
          },
          onFail: (error) {
            _canNewRequest = true;
            controller.add(false);
          }
      );
    }
  }
}