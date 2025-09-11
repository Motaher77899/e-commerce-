import 'package:flutter/material.dart';

// 🔹 Global Order List
List<Map<String, dynamic>> orderHistory = [];

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order History", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: orderHistory.isEmpty
          ? const Center(
        child: Text(
          "No previous orders found",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      )
          : ListView.builder(
        itemCount: orderHistory.length,
        itemBuilder: (context, index) {
          final order = orderHistory[index];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
            child: ListTile(
              title: Text(
                "Order #${order["id"]}",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Date: ${order["date"]}"),
                  Text("Payment: ${order["payment"]}"),
                  Text("Items: ${order["items"].length}"),
                ],
              ),
              trailing: Text(
                "\$${order["total"].toStringAsFixed(2)}",
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
