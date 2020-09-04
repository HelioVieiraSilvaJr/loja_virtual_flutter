import 'package:flutter/material.dart';
import 'package:loja_virtual_flutter/Scenes/Product/Model/ItemSize.dart';

class SizeWidget extends StatelessWidget {

  final ItemSize size;
  final Function(ItemSize size) onSelected;

  const SizeWidget({this.size, this.onSelected});

  @override
  Widget build(BuildContext context) {

    Color color = Colors.grey;
    if(size.selected) {
      color = Theme.of(context).primaryColor;
    } else if (!size.hasStock()) {
      color = Colors.red.withAlpha(50);
    }

    return GestureDetector(
      onTap: () {
        if(size.hasStock()) {
          onSelected(size);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: color
          )
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              color: color,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Text(
                size.name,
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "R\$ ${size.price}",
                style: TextStyle(
                  color: color
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
