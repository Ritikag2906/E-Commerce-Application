import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  int days = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        title: Text("Catalog App"),
      ),
      body: Center(
        child: Container(
          child: Text('Welcome to $days days of Flutter!'),
          // color: Colors.white,
        ),
      ),
      drawer: Drawer(),
    );
  }
}