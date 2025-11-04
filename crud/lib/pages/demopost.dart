import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DemoPost extends StatefulWidget {
  const DemoPost({super.key});

  @override
  State<DemoPost> createState() => _DemoPostState();
}

class _DemoPostState extends State<DemoPost> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  var response = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo Post')),
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
              var myResponse = await http.post(
                Uri.parse("https://jsonplaceholder.typicode.com/posts"),
                body: {
                  "name": nameController.text,
                  "username": usernameController.text,
                  "email": emailController.text,
                },
              );
              setState(() {
                if (myResponse.statusCode == 201) {
                  response = myResponse.body;
                } else {
                  response = "Error";
                  ;
                }
              });
            },
            child: Text("Post"),
          ),
          Text('Response JSON: $response'),
        ],
      ),
    );
  }
}
