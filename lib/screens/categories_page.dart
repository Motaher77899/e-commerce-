import 'package:flutter/material.dart';

import '../utils/app_images.dart';
import '../utils/categories_img.dart';
import '../widgets/product_card.dart';

class CategoriesPage extends StatelessWidget {

  CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categories',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            GridView.builder(
                itemCount: categories.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing:5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>  productCard(
                        product["name"],
                        product["image"],
                        product["price"],
                        ),
                      ),
                      );
                    },
                    child: buildCategory(
                        image: categories[index]['image'],
                        title: categories[index]['title'],
                        color:categories[index]['color']
                    ),
                  );
                }),



          ],
        ),
      ),
    );
  }
}

Widget buildCategory(
    {required String image, required String title, required  Color color}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(12)),
            ),
            Positioned(
              right: -20,
              top: 8,
              child: Image.asset(
                image,
                width: 50,
                height: 50,
                fit: BoxFit.contain,
              ),
            )
          ],
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        )
      ],
    ),
  );
}