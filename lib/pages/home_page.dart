import 'package:flutter/material.dart';
import 'package:master_flutter/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final int Days = 30;
  final String name = "hello world";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Center(
        child: Container(
          child: Text("welcome to $Days days of flutter finally ! $name "),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
