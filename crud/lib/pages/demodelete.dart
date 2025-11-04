import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DemoDelete extends StatefulWidget {
  const DemoDelete({super.key});

  @override
  State<DemoDelete> createState() => _DemoDeleteState();
}

class _DemoDeleteState extends State<DemoDelete> {
  String response = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo Delete')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                var myResponse = await http.delete(
                  Uri.parse("https://jsonplaceholder.typicode.com/users/2"),
                );
                setState(() {
                  if (myResponse.statusCode == 200) {
                    response = "Deleted";
                  } else {
                    response = "Error";
                  }
                });
              },
              child: Text('Delete'),
            ),
            Text('Response JSON: $response'),
          ],
        ),
      ),
    );
  }
}
