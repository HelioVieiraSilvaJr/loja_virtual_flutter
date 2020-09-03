import 'package:flutter/material.dart';
import 'package:loja_virtual_flutter/Scenes/BaseScreens.dart';

class App extends StatelessWidget {

  static final App _instance = App._internal();
  App._internal();
  factory App() => _instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getThemeData(),
      debugShowCheckedModeBanner: false,
      home: BaseScreens(),
    );
  }

  // MARK: Methods
  ThemeData getThemeData() {
    return ThemeData(
        primaryColor: Colors.amber,
        scaffoldBackgroundColor: Colors.grey[200],
        appBarTheme: AppBarTheme(
            elevation: 0
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity
    );
  }
}