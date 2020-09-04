import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual_flutter/Scenes/Product/Detail/View/SizeWidget.dart';
import 'package:loja_virtual_flutter/Scenes/Product/Model/Product.dart';

class ProductScreen extends StatefulWidget {

  final Product product;

  ProductScreen({this.product});

  MaterialPageRoute builder({BuildContext context, Product product}) {
    return MaterialPageRoute(
        builder: (context) => ProductScreen(product: product,)
    );
  }

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {

    final product = widget.product;
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1,
            child: Carousel(
              images: product.images.map((url) {
                return NetworkImage(url);
              }).toList(),
              dotSize: 4,
              dotColor: primaryColor,
              dotBgColor: Colors.transparent,
              autoplay: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  product.name,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    "a partir de",
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600]
                    ),
                  ),
                ),
                Text(
                  product.price,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primaryColor
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    "descrição",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  product.description,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    "tamanhos",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: product.sizes.map((size) {
                    return SizeWidget(
                      size: size,
                      onSelected: (sizeSelected){
                        setState(() {
                          product.sizeSelected = sizeSelected;
                        });
                      },
                    );
                  }).toList(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
