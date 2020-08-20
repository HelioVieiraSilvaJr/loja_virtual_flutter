import 'package:flutter/material.dart';
import 'package:loja_virtual_flutter/Scenes/Product/List/ProductListViewModel.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inicio"),
      ),
      body: StreamBuilder(
          stream: viewModel.controller.stream,
          initialData: new Product(),
          builder: (context, snapshot) {
            print("HELIO: $snapshot");
            var products = viewModel.products;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, indice) {
                Product product = products[indice];
                return ListTile(
                  title: Text(product.name),
                  onTap: (){
                    print("clicou item: ${product.description}");
                  },
                );
              },
            );
          }
      ),
    );
  }
}
