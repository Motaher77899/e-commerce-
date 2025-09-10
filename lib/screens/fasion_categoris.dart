import 'package:flutter/material.dart';
import '../../utils/app_images.dart';
import 'package:ecommerce/screens/Fashion_Category_Detail_Screen.dart';

class FashionCategoriesScreen extends StatefulWidget {
  const FashionCategoriesScreen({super.key});

  @override
  State<FashionCategoriesScreen> createState() =>
      _FashionCategoriesScreenState();
}

class _FashionCategoriesScreenState extends State<FashionCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final int crossAxisCount = screenWidth > 600 ? 4 : 2;
    final double spacing = 10;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
          title: const Text(
        "Fashion Categories",
      )),
      body: Padding(
        padding: EdgeInsets.all(spacing),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: AppImages.fashionCategories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: spacing,
            crossAxisSpacing: spacing,
            childAspectRatio: 0.65,
          ),
          itemBuilder: (context, index) {
            final item = AppImages.fashionCategories[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FashionCategoryDetailScreen(item: item),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    Hero(
                      tag: item.image,
                      child: Image.asset(item.image,
                          fit: BoxFit.cover, width: double.infinity),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            item.isWishlisted = !item.isWishlisted;
                          });
                        },
                        child: Icon(
                          item.isWishlisted
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: item.isWishlisted ? Colors.red : Colors.grey,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.black.withOpacity(0.3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(item.name,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            Text(item.price,
                                style: const TextStyle(color: Colors.white)),
                            const SizedBox(height: 4),
                            ElevatedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text("${item.name} added to cart!")),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                minimumSize: const Size(double.infinity, 30),
                              ),
                              child: const Text(
                                "Add to Cart",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
