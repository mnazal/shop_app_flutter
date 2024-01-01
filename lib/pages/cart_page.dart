import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Cart",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: ((context, index) {
          final cartProduct = cart[index];
          return ListTile(
            title: Text(
              cartProduct['title'] as String,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            subtitle: Text(
                "Size : ${cartProduct['size'].toString()}\nPrice : ${cartProduct['price'].toString()}"),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(cartProduct['imageUrl'] as String),
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          "Delete Product",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        content: const Text('Are you sure to delete the item?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'No',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              )),
                          TextButton(
                              onPressed: () {
                                context
                                    .read<CartProvider>()
                                    .removeProduct(cartProduct);
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'Yes',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ))
                        ],
                      );
                    });
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          );
        }),
      ),
    );
  }
}
