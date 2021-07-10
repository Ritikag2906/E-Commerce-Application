import 'package:catalog/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  int days = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 0.0,
        // backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),

        shadowColor: Colors.black,
        title: Text(
          "Catalog App",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
          ),
        ),
      ),
      body: Center(
        child: Container(
          child: Text(
            'Welcome to $days days of Flutter!',
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
