import 'package:flutter/material.dart';
import 'package:loja_virtual_flutter/Commons/DrawerCustom/DrawerCustom.dart';
import 'package:loja_virtual_flutter/Screens/PageManager.dart';
import 'package:loja_virtual_flutter/Screens/SignIn/SignInScreen.dart';
import 'package:provider/provider.dart';

class BaseScreens extends StatefulWidget {
  @override
  _BaseScreensState createState() => _BaseScreensState();
}

class _BaseScreensState extends State<BaseScreens> {

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          Scaffold(
            drawer: DrawerCustom(),
            appBar: AppBar(
              title: Text("Inicio"),
            ),
            body: Container(),
          ),
          Scaffold(
            drawer: DrawerCustom(),
            appBar: AppBar(
              title: Text("Produtos"),
            ),
            body: Container(),
          ),Scaffold(
            drawer: DrawerCustom(),
            appBar: AppBar(
              title: Text("Meus Pedidos"),
            ),
            body: Container(),
          ),
          Scaffold(
            drawer: DrawerCustom(),
            appBar: AppBar(
              title: Text("Lojas"),
            ),
            body: Container(),
          ),
        ],
      ),
    );
  }
}
