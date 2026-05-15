import 'package:flutter/material.dart';
import 'models/user_model.dart'; // Import your model

void main() {
  runApp(const MaterialApp(home: UserScreen()));
}

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late UserModel user;

  @override
  void initState() {
    super.initState();
    
    // 2. SIMULATE THE DATA (This would usually come from an API)
    Map<String, dynamic> rawJson = {
      "id": 1,
      "name": "Ajmal",
      "email": "ajmal@test.com",
      "phone": "9876543210",
      "address": {"city": "Calicut", "street": "Kallai Road"}
    };

    user = UserModel.fromJson(rawJson);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Profile")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text("Personal Details", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: Text(user.name),
            subtitle: Text(user.email),
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: Text(user.phone ?? "No Phone Number"),
          ),
          const SizedBox(height: 20),
          const Text("Address", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.location_city),
            title: Text(user.address?.city ?? "N/A"),
            subtitle: Text(user.address?.street ?? "N/A"),
          ),
        ],
      ),
    );
  }
}