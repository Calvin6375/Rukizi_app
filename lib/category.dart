import 'package:flutter/material.dart';
import 'cart.dart';
import 'contact.dart'; // Import ContactPage

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  // List of products
  final List<Map<String, String>> products = [
    {'name': 'Sugar Sprinkles', 'image': 'assets/product_0.png'},
    {'name': 'Chillied', 'image': 'assets/product_1.png'},
    {'name': 'Plain', 'image': 'assets/product_2.png'},
    {'name': 'Salted', 'image': 'assets/product_3.png'},
  ];

  // Cart state
  List<Map<String, String>> cart = [];
  int cartCount = 0;

  // Add to cart function
  void addToCart(Map<String, String> product) {
    setState(() {
      // Check if product is already in the cart
      bool exists = cart.any((item) => item['name'] == product['name']);
      if (!exists) {
        cart.add(product);
        cartCount = cart.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Changed background color to white
      body: Column(
        children: [
          // Top Section
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // Updated to white
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
                
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Scrollable White Container with Rounded Edges
                  Container(
                    width: 440,
                    height: 360,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 15.0,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: PageView(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/s1.png',
                            fit: BoxFit.cover, // Adjust image to fill space
                            height: 200, // Adjust image height
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/s2.png',
                            fit: BoxFit.cover, // Adjust image to fill space
                            height: 200, // Adjust image height
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/s3.png',
                            fit: BoxFit.cover, // Adjust image to fill space
                            height: 200, // Adjust image height
                          ),
                        ),
                      ],
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Product Grid Section
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.8,
                children: List.generate(products.length, (index) {
                  final product = products[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Product Image
                        Image.asset(
                          product['image'] ?? '',
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 8),
                        // Product Title
                        Text(
                          product['name'] ?? 'Unknown',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                        // Add to Cart Button
                        ElevatedButton(
                          onPressed: () {
                            addToCart(product);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffff9800),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text('Add to Cart'),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),

          // Bottom Navigation Bar
          Container(
            color: Color(0xffff9800),
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(
                  children: [
                    IconButton(
                      icon: Icon(Icons.shopping_cart, color: Colors.white),
                      onPressed: () {
                        // Navigate to Cart page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartPage(cart: cart),
                          ),
                        );
                      },
                    ),
                    if (cartCount > 0)
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '$cartCount',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.home, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context); // Go back to the home screen
                  },
                ),
                IconButton(
                  icon: Icon(Icons.phone, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ContactPage(), // Navigate to ContactPage
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
