import 'package:flutter/material.dart';
import 'package:loja_virtual_flutter/Commons/UserManager.dart';
import 'package:loja_virtual_flutter/Screens/BaseScreens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Provider(
      create: (_) => UserManager(),
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
      ),
    );
  }
}
