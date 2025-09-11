import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'product_details_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Dummy pages
  final List<Widget> _pages = [
    const HomePageContent(),
    const Center(child: Text("Categories Page")),
    CartPage(),
    const Center(child: Text("Account Page")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      // 🔽 Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {"name": "Shoes", "icon": Icons.shopping_bag},
      {"name": "Clothes", "icon": Icons.checkroom},
      {"name": "Electronics", "icon": Icons.devices},
      {"name": "Beauty", "icon": Icons.face},
      {"name": "Sports", "icon": Icons.sports_soccer},
    ];

    final List<Map<String, dynamic>> products = [
      {
        "name": "Laptop",
        "price": "\$1200",
        "image": "assets/laptop/IMG_3191.JPG",
      },
      {
        "name": "Juice",
        "price": "\$5",
        "image": "assets/juce_water/IMG_3143.JPG",
      },
      {
        "name": "Iphone",
        "price": "\$60",
        "image": "assets/mobiles/IMG_3163.JPG",
      },
      {
        "name": "Mobile Phone",
        "price": "\$800",
        "image": "assets/mobiles/IMG_3176.JPG",
      },
      {
        "name": "Watch",
        "price": "\$100",
        "image": "assets/laptop/IMG_3193.JPG",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "E-Commerce",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔍 Search bar
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search products...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // 🏷 Categories
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return categoryCard(
                    categories[index]["name"],
                    categories[index]["icon"],
                  );
                },
              ),
            ),

            // 🛍 Products
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Text(
                "Popular Products",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailsPage(
                          name: product["name"],
                          image: product["image"],
                          price: product["price"],
                        ),
                      ),
                    );
                  },
                  child: productCard(
                    product["name"],
                    product["image"],
                    product["price"],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  // Category Card Widget
  static Widget categoryCard(String name, IconData icon) {
    return Container(
      width: 90,
      margin: const EdgeInsets.only(left: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: const Offset(2, 2),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30, color: Colors.blue),
          const SizedBox(height: 6),
          Text(name, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  // Product Card Widget
  static Widget productCard(String name, String image, String price) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: const Offset(2, 2),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(image, fit: BoxFit.cover, width: double.infinity),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              price,
              style: const TextStyle(color: Colors.blue, fontSize: 13),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
