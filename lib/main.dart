import 'package:flutter/material.dart';
import 'package:loja_virtual_flutter/Commons/UserManager.dart';
import 'package:loja_virtual_flutter/Screens/BaseScreens.dart';
import 'package:loja_virtual_flutter/Screens/SignUp/SignUpScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    UserManager userManager = UserManager();

    return Provider(
      create: (_) => userManager,
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: const Color.fromARGB(255, 4, 125, 141),
            scaffoldBackgroundColor: const Color.fromARGB(255, 4, 125, 141),
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
      ),
    );
  }
}
