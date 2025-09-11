import 'package:flutter/material.dart';
import '../utils/cart_items.dart';
import 'order_success_page.dart';


class CheckoutPage extends StatefulWidget {
  final double totalAmount;

  const CheckoutPage({super.key, required this.totalAmount});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  String _paymentMethod = "Cash on Delivery";

  void _placeOrder() {
    if (_formKey.currentState!.validate()) {
      // ✅ এখানে চাইলে API কল করা যাবে
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OrderSuccessPage()),
      );
      setState(() {
        cartItems.clear(); // Checkout এর পর Cart খালি হবে
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text("Shipping Information",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),

              // Name
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Full Name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                value!.isEmpty ? "Please enter your name" : null,
              ),
              const SizedBox(height: 12),

              // Address
              TextFormField(
                controller: _addressController,
                maxLines: 2,
                decoration: const InputDecoration(
                  labelText: "Shipping Address",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                value!.isEmpty ? "Please enter your address" : null,
              ),
              const SizedBox(height: 12),

              // Phone
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "Phone Number",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                value!.isEmpty ? "Please enter your phone number" : null,
              ),
              const SizedBox(height: 20),

              const Text("Payment Method",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),

              // Payment Options
              RadioListTile(
                title: const Text("Cash on Delivery"),
                value: "Cash on Delivery",
                groupValue: _paymentMethod,
                onChanged: (value) {
                  setState(() {
                    _paymentMethod = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: const Text("Credit/Debit Card"),
                value: "Card",
                groupValue: _paymentMethod,
                onChanged: (value) {
                  setState(() {
                    _paymentMethod = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: const Text("Mobile Banking (Bkash/Nagad)"),
                value: "Mobile Banking",
                groupValue: _paymentMethod,
                onChanged: (value) {
                  setState(() {
                    _paymentMethod = value.toString();
                  });
                },
              ),

              const SizedBox(height: 20),

              // Order Summary
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total Amount:",
                        style: TextStyle(fontSize: 16)),
                    Text("\$${widget.totalAmount.toStringAsFixed(2)}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Place Order Button
              ElevatedButton(
                onPressed: _placeOrder,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Place Order",
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
