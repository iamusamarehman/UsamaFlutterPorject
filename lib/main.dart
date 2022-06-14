import 'package:flutter/material.dart';
import 'package:master_flutter/pages/cart_page.dart';
import 'package:master_flutter/pages/home_page.dart';
import 'package:master_flutter/pages/login_page.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';
import 'package:master_flutter/pages/utils/route.dart';
import 'package:master_flutter/widgets/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.cartRoute: (context) => const CartPage()
      },
    );
  }
}
