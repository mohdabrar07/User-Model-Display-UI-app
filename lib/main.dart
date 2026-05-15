import 'package:flutter/material.dart';
import 'user_model.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  
    Map<String, dynamic> rawJson = {
      "id": 1,
      "name": "Ajmal",
      "email": "ajmal@test.com",
      "phone": "9876543210",
      "address": {
        "city": "Calicut",
        "street": "Kallai Road"
      }
    };

    // 2. CONVERT JSON TO DART OBJECT
    UserModel user = UserModel.fromJson(rawJson);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("User Details")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("User Information", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.person),
                title: Text("Name: ${user.name}"),
                subtitle: Text("Email: ${user.email}"),
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: Text("Phone: ${user.phone ?? 'N/A'}"),
              ),
              ListTile(
                leading: const Icon(Icons.location_on),
                title: Text("Address"),
                subtitle: Text("${user.address?.street}, ${user.address?.city}"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}