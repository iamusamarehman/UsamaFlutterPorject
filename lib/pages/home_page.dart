import 'package:flutter/material.dart';
import 'package:master_flutter/models/catalog.dart';
import 'package:master_flutter/widgets/drawer.dart';

import '../widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  final int Days = 30;
  final String name = "hello world";

  @override
  Widget build(BuildContext context) {
    final dummylist = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummylist.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemWidget(
              item: dummylist[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
