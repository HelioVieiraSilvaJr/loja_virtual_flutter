import 'dart:async';
import 'package:loja_virtual_flutter/Scenes/Product/Model/Product.dart';
import 'package:loja_virtual_flutter/Scenes/Product/Repository/ProductListRepository.dart';

class ProductListViewModel {

  final _repository = ProductListRepository();

  final controller = StreamController<bool>.broadcast();
  List<Product> products = [];
  int productsLength = 0;
  bool _canNewRequest = true;

  Future<void> fetchProducts() async {
      await _repository.getProducts(
          onSuccess: (newProducts) {
            products = newProducts;
            productsLength = newProducts.length;
            controller.add(true);
          },
          onFail: (error) {
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