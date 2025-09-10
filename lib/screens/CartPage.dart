import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Cart")),
      body: const Center(
        child: Text(
          "This is your cart page",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
