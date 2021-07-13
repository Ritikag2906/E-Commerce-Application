import 'package:catalog/models/catalog.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:catalog/widgets/drawer.dart';
import 'package:catalog/widgets/item_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int days = 30;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.jason");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        shadowColor: Colors.black,
        title: Text(
          "Catalog App",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: CatalogModel.items.length,
          itemBuilder: (context, Index) {
            return ItemWidget(
              item: CatalogModel.items[Index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
