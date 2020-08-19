import 'package:flutter/material.dart';
import 'package:loja_virtual_flutter/Commons/UserManager.dart';
import 'package:loja_virtual_flutter/Screens/BaseScreens.dart';
import 'package:loja_virtual_flutter/Screens/SignUp/SignUpScreen.dart';
import 'package:provider/provider.dart';

import 'Screens/SignIn/SignInScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.amber,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
              elevation: 0
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      debugShowCheckedModeBanner: false,
      home: BaseScreens(),
      initialRoute: '/base',
      onGenerateRoute: (settings) {
        switch(settings.name){
          case '/signin':
            print("Deve abrir SignInScreen");
            return MaterialPageRoute(
                builder: (_) => SignInScreen()
            );
          case '/signup':
            return MaterialPageRoute(
                builder: (_) => SignUpScreen()
            );
          case '/base':
          default:
            return MaterialPageRoute(
                builder: (_) => BaseScreens()
            );
        }
      },
    );
  }
}
