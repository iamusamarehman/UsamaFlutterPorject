import 'package:flutter/material.dart';
import 'package:master_flutter/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(children: [
        _CartList().p32().expand(),
        const Divider(),
        _CartTotal(),
      ]), // exxpand to full size
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel? _cart = (VxState.store as MyStore).cart;
    return SizedBox(
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            VxBuilder(
                builder: ((context, store, status) {
                  return "\$${_cart?.totalPrice}"
                      .text
                      .xl5
                      .color(context.theme.colorScheme.secondary)
                      .make();
                }),
                mutations: const {RemoveMutation}),
            30.widthBox,
            ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: "Buying not supported yet.".text.make(),
                      ));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          context.theme.indicatorColor),
                    ),
                    child: "Buy".text.make())
                .w32(context),
          ],
        ));
  }
}

class _CartList extends StatelessWidget {
  final CartModel? _cart = (VxState.store as MyStore).cart;
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    return _cart!.items.isEmpty
        ? "nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart!.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.done),
              trailing: IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: () => RemoveMutation(_cart!.items[index]),
              ),
              title: _cart!.items[index].name.text.make(),
            ),
          );
  }
}
