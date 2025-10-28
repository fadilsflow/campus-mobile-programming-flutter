import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DemoGet extends StatefulWidget {
  const DemoGet({super.key});

  @override
  State<DemoGet> createState() => _DemoGetState();
}

class _DemoGetState extends State<DemoGet> {
  String name = "kosong";
  String email = "kosong";
  String phone = "kosong";

  Future<void> fetchUserData() async {
    var response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/users/1"),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        name = data['name'];
        email = data['email'];
        phone = data['phone'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo GET Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is the Demo GET Page'),
            ElevatedButton(
              onPressed: fetchUserData,
              child: Text("Get Data User"),
            ),
            Text("Name: $name"),
            Text("Email: $email"),
            Text("Phone: $phone"),
          ],
        ),
      ),
    );
  }
}
