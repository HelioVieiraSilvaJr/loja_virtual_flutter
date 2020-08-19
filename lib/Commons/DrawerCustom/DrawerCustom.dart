import 'package:flutter/material.dart';
import 'package:loja_virtual_flutter/Commons/DrawerCustom/DrawerHeaderCustom.dart';
import 'package:loja_virtual_flutter/Commons/DrawerCustom/DrawerTile.dart';

class DrawerCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.white
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              )
            ),
          ),
          ListView(
            children: <Widget>[
              DrawerHeaderCustom(),
              const Divider(),
              DrawerTile(iconData: Icons.home, title: "Início", page: 0),
              DrawerTile(iconData: Icons.list, title: "Produtos", page: 1),
              DrawerTile(iconData: Icons.playlist_add_check, title: "Meus Pedidos", page: 2),
              DrawerTile(iconData: Icons.location_on, title: "Lojas", page: 3),
            ],
          ),
        ],
      ),
    );
  }
}
