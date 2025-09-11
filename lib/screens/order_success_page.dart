import 'package:flutter/material.dart';

class OrderSuccessPage extends StatelessWidget {
  const OrderSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 100),
            const SizedBox(height: 20),
            const Text(
              "Order Placed Successfully!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text("Thank you for shopping with us"),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
              ),
              child: const Text("Back to Home"),
            ),
          ],
        ),
      ),
    );
  }
}
