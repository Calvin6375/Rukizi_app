import 'package:flutter/material.dart';
import 'instasend_service.dart';

class CartPage extends StatefulWidget {
  final List<Map<String, String>> cart;

  CartPage({required this.cart}) : super();

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late List<Map<String, String>> mutableCart;
  late List<int> quantities;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    mutableCart = List<Map<String, String>>.from(widget.cart);
    quantities = List<int>.filled(mutableCart.length, 1);
  }

  void updateQuantity(int index, int quantity) {
    setState(() {
      if (quantity <= 0) {
        mutableCart.removeAt(index);
        quantities.removeAt(index);
      } else {
        quantities[index] = quantity;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double totalAmount = 0;
    const double productPrice = 1000.0;

    for (int i = 0; i < mutableCart.length; i++) {
      totalAmount += productPrice * quantities[i];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: mutableCart.isEmpty
          ? Center(child: Text('Your cart is empty!'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: mutableCart.length,
                    itemBuilder: (context, index) {
                      Map<String, String> product = mutableCart[index];
                      return Card(
                        margin: EdgeInsets.all(16),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.asset(
                                product['image'] ?? '',
                                height: 70,
                                width: 70,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product['name'] ?? 'Unknown',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.remove),
                                        onPressed: () {
                                          if (quantities[index] > 1) {
                                            updateQuantity(
                                                index, quantities[index] - 1);
                                          } else {
                                            updateQuantity(index, 0);
                                          }
                                        },
                                      ),
                                      Text('${quantities[index]}'),
                                      IconButton(
                                        icon: Icon(Icons.add),
                                        onPressed: () {
                                          updateQuantity(
                                              index, quantities[index] + 1);
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Spacer(),
                              Text(
                                'KES ${productPrice * quantities[index]}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Currency',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'KES',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Amount',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                totalAmount.toStringAsFixed(0),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      // First Name Input Field
                      TextField(
                        controller: firstNameController,
                        decoration: InputDecoration(
                          labelText: 'First Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Last Name Input Field
                      TextField(
                        controller: lastNameController,
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Email Input Field
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 20),
                      // Checkout Button
                      ElevatedButton(
                        onPressed: () {
                          String firstName = firstNameController.text;
                          String lastName = lastNameController.text;
                          String email = emailController.text;

                          // Check if the fields are filled
                          if (firstName.isEmpty ||
                              lastName.isEmpty ||
                              email.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Please fill in all fields."),
                              ),
                            );
                            return;
                          }

                          // Placeholder checkout functionality
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Proceeding with payment for $firstName $lastName."),
                            ),
                          );
                        },
                        child: Text('Checkout'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orangeAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
