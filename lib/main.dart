import 'package:catalog/screens/home_screen.dart';
import 'package:catalog/screens/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catalog App',
      debugShowCheckedModeBanner: false,
      // home: HomeScreen(),
      themeMode: ThemeMode.dark,
      // theme: ThemeData(primarySwatch: Colors.purpleAccent),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      routes: {
        "/": (context) => HomeScreen(),
        "/home": (context) => HomeScreen(),
        "/login": (context) => LoginPage()
      },
    );
  }
}
