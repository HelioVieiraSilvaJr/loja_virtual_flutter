import 'package:flutter/material.dart';
import 'package:loja_virtual_flutter/Scenes/Product/Model/Product.dart';

class ProductListTileView extends StatefulWidget {

  ProductListTileView({this.product});

  final Product product;

  @override
  _ProductListTileViewState createState() => _ProductListTileViewState();
}

class _ProductListTileViewState extends State<ProductListTileView> {

  @override
  Widget build(BuildContext context) {

    Product product = widget.product;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Container(
        height: 100,
        padding: EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child: product.getFirstImage() != null ? Image.network(product.getFirstImage()) : Container(),
            ),
            const SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(product.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800
                    ),
                  ),
                  Text("a apartir de",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[400],
                    ),
                  ),
                  Text(product.price,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      color: Theme.of(context).primaryColor
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
//Image.network(product.images.first)