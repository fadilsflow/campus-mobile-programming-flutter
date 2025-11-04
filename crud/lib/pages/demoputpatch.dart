import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DemoPutPatch extends StatefulWidget {
  const DemoPutPatch({super.key});

  @override
  State<DemoPutPatch> createState() => _DemoPutPatchState();
}

class _DemoPutPatchState extends State<DemoPutPatch> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  var response = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo Put Patch')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text("Name"),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter your name",
            ),
            controller: nameController,
          ),
          SizedBox(height: 10),
          Text("Username"),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter your username",
            ),
            controller: usernameController,
          ),
          SizedBox(height: 10),
          Text("Email"),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter your Email",
            ),
            controller: emailController,
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () async {
              var myResponse = await http.put(
                Uri.parse("https://jsonplaceholder.typicode.com/users/2"),
                body: {
                  "name": nameController.text,
                  "username": usernameController.text,
                  "email": emailController.text,
                },
              );
              setState(() {
                if (myResponse.statusCode == 200) {
                  response = myResponse.body;
                } else {
                  response = "Error";
                }
              });
            },
            child: Text("Put"),
          ),
          Text('Response JSON: $response'),
          ElevatedButton(
            onPressed: () async {
              var myResponse = await http.patch(
                Uri.parse("https://jsonplaceholder.typicode.com/users/2"),
                body: {
                  "name": nameController.text,
                  "username": usernameController.text,
                  "email": emailController.text,
                },
              );
              setState(() {
                if (myResponse.statusCode == 200) {
                  response = myResponse.body;
                } else {
                  response = "Error";
                }
              });
            },
            child: Text("Patch"),
          ),
          Text('Response JSON Patch: $response'),
        ],
      ),
    );
  }
}
