import 'package:catalog/models/catalog.dart';
import 'package:catalog/widgets/themes.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
// import 'package:catalog/widgets/drawer.dart';
// import 'package:catalog/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

// import 'package:flutter_catalog/widgets/themes.dart';
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
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
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
        backgroundColor: Mytheme.creamColor,
        body: SafeArea(
          child: Container(
              // height: MediaQuery.of(context).size.height * 0.9,
              padding: Vx.m32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CatalogHeader(),
                  if (CatalogModel.items != null &&
                      CatalogModel.items.isNotEmpty)
                    CatalogList().expand()
                  else
                    Center(
                      child: CircularProgressIndicator(),
                    )
                ],
              )),
        ));
  }
}

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        "Catalog App".text.xl5.bold.color(Mytheme.darkBluishColor).make(),
        "Trending Products".text.xl2.make()
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(
          image: catalog.image,
        ),
        Expanded(
          child: Column(
            children: [catalog.name.text.make()],
          ),
        )
      ],
    )).white.roundedLg.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key key, @required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(Mytheme.creamColor)
        .make()
        .p16()
        .w40(context);
  }
}
