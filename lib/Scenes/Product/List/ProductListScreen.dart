import 'package:flutter/material.dart';
import 'package:loja_virtual_flutter/Commons/DrawerCustom/DrawerCustom.dart';
import 'package:loja_virtual_flutter/Scenes/Product/Detail/ProductScreen.dart';
import 'package:loja_virtual_flutter/Scenes/Product/List/ProductListViewModel.dart';
import 'package:loja_virtual_flutter/Scenes/Product/List/View/ProductListTileView.dart';
import 'package:loja_virtual_flutter/Scenes/Product/List/View/SearchDialogView.dart';
import 'package:loja_virtual_flutter/Scenes/Product/Model/Product.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();

  MaterialPageRoute builder(BuildContext context) {
    return MaterialPageRoute(
        builder: (context) => ProductListScreen()
    );
  }
}

class _ProductListScreenState extends State<ProductListScreen> {

  var viewModel = ProductListViewModel();

  @override
  void initState() {
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
    return StreamBuilder<Object>(
      stream: viewModel.controller.stream,
      builder: (context, _) {

        final products = viewModel.products;

        return Scaffold(
          drawer: DrawerCustom(),
          appBar: AppBar(
            title: viewModel.search.isEmpty
                ? Text("Produtos")
                : LayoutBuilder(
                    builder: (_, constraints) {
                      return GestureDetector(
                        onTap: () async {
                          final search = await showDialog(context: context, builder: (_) => SearchDialogView(initialText: viewModel.search,));
                          if(search != null) {
                            viewModel.search = search;
                          }
                        },
                        child: Container(
                            width: constraints.biggest.width,
                            child: Text(viewModel.search)
                        ),
                      );
                    },
                ),
            actions: <Widget>[
              viewModel.search.isEmpty
                ? IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () async {
                      final search = await showDialog(context: context, builder: (_) => SearchDialogView(initialText: viewModel.search,));
                      if(search != null) {
                        viewModel.search = search;
                      }
                    },
                )
                  : IconButton(
                icon: Icon(Icons.close),
                onPressed: () async {
                  viewModel.search = '';
                },
              )
            ],
          ),
          body: ListView.builder(
            padding: EdgeInsets.only(left: 10, right: 10),
            itemCount: viewModel.productsLength,
            itemBuilder: (context, index) {
              Product product = products[index];
              if(index > (viewModel.productsLength - 5)) {
                viewModel.fetchNextProducts();
              }
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(ProductScreen().builder(
                    context: context,
                    product: product
                  ));
                },
                child: ProductListTileView(
                  product: product,
                ),
              );
            },
          )
        );
      }
    );
  }
}
