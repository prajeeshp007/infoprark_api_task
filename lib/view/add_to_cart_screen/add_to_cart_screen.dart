import 'package:flutter/material.dart';
import 'package:infoprark_api_task/controller/add_to_cart_Screen_controller.dart';
import 'package:provider/provider.dart';

class AddToCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Cart'),
      ),
      body: Consumer<AddToCartScreenController>(
        builder: (context, cartProvider, child) {
          if (cartProvider.cartItems.isEmpty) {
            return Center(
              child: Text('Your cart is empty!'),
            );
          }

          return ListView.separated(
            itemBuilder: (context, index) {
              final item = cartProvider.cartItems[index];
              return ListTile(
                leading: Image.network(item['image'], width: 50, height: 50),
                title: Text(item['name']),
                subtitle: Text(item['description'] ?? ''),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    cartProvider.removeFromCart(item['id']);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('${item['name']} removed from cart!')),
                    );
                  },
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemCount: cartProvider.cartItems.length,
          );
        },
      ),
    );
  }
}
