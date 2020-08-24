import 'package:flutter/material.dart';
import 'package:loja_virtual_flutter/Scenes/Product/List/ProductListViewModel.dart';
import 'package:loja_virtual_flutter/Scenes/Product/List/View/ProductListTileView.dart';
import 'package:loja_virtual_flutter/Scenes/Product/Model/Product.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  var viewModel = ProductListViewModel();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    viewModel.fetchProducts();
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.controller.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inicio"),
      ),
      body: StreamBuilder(
          stream: viewModel.controller.stream,
          initialData: new Product(),
          builder: (context, snapshot) {
            var products = viewModel.products;
            return ListView.builder(
              padding: EdgeInsets.only(left: 10, right: 10),
              itemCount: viewModel.productsLength,
              itemBuilder: (context, index) {
                Product product = products[index];
                if(index > (viewModel.productsLength - 5)) {
                  viewModel.fetchNextProducts();
                }
                return GestureDetector(
                  onTap: () {
                    print("==> Click product: ${product.id}");
                  },
                  child: ProductListTileView(
                    product: product,
                  ),
                );
              },
            );
          }
      ),
    );
  }
}
