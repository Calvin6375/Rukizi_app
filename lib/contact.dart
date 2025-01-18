import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // WhatsApp contact card
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.chat_bubble, color: Colors.green),
                title: Text('+254742844875'),
                onTap: () {
                  // Handle WhatsApp action
                },
              ),
            ),
            SizedBox(height: 16),
            // Email contact card
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.email, color: Colors.blue),
                title: Text('calvinrumba27@gmail.com'),
                onTap: () {
                  // Handle email action
                },
              ),
            ),
            SizedBox(height: 16),
            // Call contact card
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.phone, color: Colors.orange),
                title: Text('0742833875'),
                onTap: () {
                  // Handle call action
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}