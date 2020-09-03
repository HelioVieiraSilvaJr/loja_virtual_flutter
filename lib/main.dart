import 'package:flutter/material.dart';
import 'package:loja_virtual_flutter/Scenes/BaseScreens.dart';
import 'package:loja_virtual_flutter/Scenes/Product/Detail/ProductScreen.dart';
import 'package:loja_virtual_flutter/Scenes/Product/Model/Product.dart';
import 'Scenes/SignIn/SignInScreen.dart';
import 'Scenes/SignUp/SignUpScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.amber,
          scaffoldBackgroundColor: Colors.grey[200],
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
            return MaterialPageRoute(
                builder: (_) => SignInScreen()
            );
          case '/signup':
            return MaterialPageRoute(
                builder: (_) => SignUpScreen()
            );
          case '/product':
            return MaterialPageRoute(
                builder: (_) => ProductScreen(
                  product: settings.arguments as Product,
                )
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
