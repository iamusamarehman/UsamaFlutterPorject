import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:master_flutter/core/store.dart';
import 'package:master_flutter/models/cart.dart';
import 'package:master_flutter/models/catalog.dart';
import 'package:master_flutter/pages/utils/route.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';
// ignore: unused_import
import '../widgets/themes.dart';
import 'package:http/http.dart' as http;

// import 'package:flutter_catalog/widgets/themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: non_constant_identifier_names
  final int Days = 30;

  final url = "https://api.jsonbin.io/b/62b5553f402a5b38023676f9";

  get buttonColor => null;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    // var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    var decodeData = jsonDecode(catalogJson);
    var productData = decodeData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  final String name = "hello world";

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
        backgroundColor: context.cardColor,
        floatingActionButton: VxBuilder(
          mutations: const {AddMutation, RemoveMutation},
          builder: ((context, store, status) => FloatingActionButton(
                // ignore: deprecated_member_use
                backgroundColor: Theme.of(context).indicatorColor,
                onPressed: () =>
                    Navigator.pushNamed(context, MyRoutes.cartRoute),
                child: const Icon(
                  CupertinoIcons.cart,
                  color: Colors.white,
                ),
              ).badge(
                  color: Vx.gray200,
                  size: 22,
                  count: _cart?.items.length,
                  textStyle: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ))),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CatalogHeader(),
                if (CatalogModel.items.isNotEmpty)
                  const CatalogList().py16().expand()
                else
                  const CircularProgressIndicator().centered().expand()
              ],
            ),
          ),
        ));
  }
}
