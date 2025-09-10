import 'package:flutter/material.dart';
import '../../utils/app_images.dart';

class FashionCategoryDetailScreen extends StatelessWidget {
  final FashionCategory item;
  const FashionCategoryDetailScreen({super.key, required this.item});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.name)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: item.image,
              child: Image.asset(item.image, fit: BoxFit.cover, width: double.infinity, height: 600),
            ),
            const SizedBox(height: 20),
            Text(item.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(item.price, style: const TextStyle(fontSize: 20, color: Colors.green)),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "This is a detailed description of the product. You can add more info here like material, size, color options, and other features. Perfect for your ecommerce app display!",
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${item.name} added to cart!")),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              child: const Text("Add to Cart", style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
