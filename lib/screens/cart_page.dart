import 'package:flutter/material.dart';
import '../utils/cart_items.dart';

import 'checkout_page.dart';
import 'order_success_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    double total = 0;
    for (var item in cartItems) {
      double price = double.tryParse(item["price"].toString().replaceAll("\$", "")) ?? 0;
      int qty = item["quantity"] ?? 1;
      total += price * qty;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: cartItems.isEmpty
          ? const Center(
        child: Text(
          "Your cart is empty",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                int qty = item["quantity"] ?? 1;

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        item["image"],
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      item["name"],
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item["price"],
                          style: const TextStyle(color: Colors.blue, fontSize: 13),
                        ),
                        const SizedBox(height: 6),

                        // 🔹 Quantity Row
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  if (qty > 1) {
                                    item["quantity"] = qty - 1;
                                  }
                                });
                              },
                            ),
                            Text(
                              "$qty",
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline, color: Colors.green),
                              onPressed: () {
                                setState(() {
                                  item["quantity"] = qty + 1;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          cartItems.removeAt(index);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),

          // Cart Summary
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Subtotal", style: TextStyle(fontSize: 16)),
                    Text("\$${total.toStringAsFixed(2)}",
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CheckoutPage(totalAmount: total),
                      ),
                    );

                    setState(() {
                      cartItems.clear(); // ✅ Checkout এর পর Cart খালি হবে
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Proceed to Checkout",
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
