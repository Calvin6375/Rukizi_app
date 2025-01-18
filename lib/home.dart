import 'package:flutter/material.dart';
import 'category.dart'; // Import Category page

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Convert 1cm to pixels based on device pixel density
    final double oneCmToPixels =
        MediaQuery.of(context).devicePixelRatio * 37.795275591; // cm to pixels

    return Scaffold(
      appBar: null, // Removed AppBar
      body: Stack(
        children: [
          // Fullscreen white container
          Container(
            color: Colors.white,
            child: Column(
              children: [
                // Move the "RUKIZI AFRICA" text 1 cm lower
                Padding(
                  padding: EdgeInsets.only(
                      top: 15.0 + oneCmToPixels), // Added oneCmToPixels
                  child: Text(
                    'RUKIZI AFRICA',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                      fontFamily: 'Lemon', // Use Lemon font
                    ),
                  ),
                ),
                // Move the "Healthy Fresh Korosho!" text 1 cm lower as well
                Padding(
                  padding: EdgeInsets.only(
                      top: 1.0 + oneCmToPixels), // Added oneCmToPixels
                  child: Text(
                    'Healthy Fresh Korosho!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff000000),
                      fontFamily: 'Lemon', // Use Lemon font
                    ),
                  ),
                ),
                // Move the image 1 cm up by reducing its top padding
                Padding(
                  padding: EdgeInsets.only(
                      top: 0.0), // Removed 1 cm from top padding
                  child: Center(
                    child: Card(
                      color: Color(0xffffffff),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                      child: Container(
                        width: 320,
                        height: 290,
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/main.png', // Add this image path if you have the image
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Orange container with rounded edges at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(top: oneCmToPixels),
              height: MediaQuery.of(context).size.height * 0.45 - oneCmToPixels,
              decoration: BoxDecoration(
                color: Color(0xffff9800),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                // Wrap the entire bottom container in SingleChildScrollView
                child: Column(
                  children: [
                    // "Popular Products" text moved up by 1 cm
                    Padding(
                      padding: EdgeInsets.only(
                          top: 0.1 * oneCmToPixels), // Reduced the top padding
                      child: Text(
                        'Popular Products',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Lemon', // Use Lemon font
                        ),
                      ),
                    ),
                    // Horizontal scrollable images
                    Padding(
                      padding: EdgeInsets.only(
                          top: 0.4 *
                              oneCmToPixels), // Reduced the top padding further
                      child: Container(
                        height: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5, // Number of images
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Container(
                                width: 160, // Width of each image
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // Removed box shadow completely
                                  boxShadow: [],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/${index + 1}.png', // Image paths (use your own assets)
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // "View All" button moved to the bottom of the screen
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the Category page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Category()), // Navigate to Category
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                  shadowColor: Colors.black.withOpacity(0.3),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 12.0),
                  child: Text(
                    'View All',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lemon', // Use Lemon font
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
