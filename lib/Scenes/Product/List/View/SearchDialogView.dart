import 'package:flutter/material.dart';

class SearchDialogView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 2,
          left: 8,
          right: 8,
          child: Card(
            child: TextFormField(
              textInputAction: TextInputAction.search,
              autocorrect: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                prefixIcon: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.grey[700],
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                )
              ),
              autofocus: true,
              onFieldSubmitted: (text){
                Navigator.of(context).pop(text);
              },
            ),
          ),
        )
      ],
    );
  }
}
