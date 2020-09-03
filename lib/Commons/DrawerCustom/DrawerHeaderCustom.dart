import 'package:flutter/material.dart';
import 'package:loja_virtual_flutter/Commons/UserManager.dart';
import 'package:loja_virtual_flutter/Scenes/SignIn/SignInScreen.dart';

class DrawerHeaderCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    bool isLogged = UserManager.instance.isLogged();

    return Container(
      padding: EdgeInsets.fromLTRB(32, 24, 16, 8),
      height: isLogged ? 180 : 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text("Minha\nLojinha",
              style: TextStyle(
                  fontSize: 34,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Visibility(
              visible: isLogged,
              child: Text("Olá, ${UserManager.instance.name}",
                style: TextStyle(
                    fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
                maxLines: 2,
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
              if(isLogged) {
                UserManager.instance.logout();
              } else {
                Navigator.of(context).push(SignInScreen().builder(context));
              }
            },
            child: Text(
                isLogged
                    ? "sair"
                    : "Entre ou cadastre-se >",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor
              ),
            ),
          )
        ],
      )
    );
  }
}
