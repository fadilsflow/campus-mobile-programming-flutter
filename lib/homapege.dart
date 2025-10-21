import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int nilai = 0;

  void notifBerhasil(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("$text $nilai"),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(label: "Batal", onPressed: () {}),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Counter App')),
        body: Builder(
          builder: (context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("$nilai", style: const TextStyle(fontSize: 48)),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            nilai--;
                          });
                        },
                        child: const Text('-'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            nilai += 1;
                          });
                        },
                        child: const Text('+'),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (builder) {
                          return AlertDialog(
                            title: Icon(Icons.warning),
                            content: Text(
                              "Apakah anda yakin ingin mereset nilai? ",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    nilai = 0;
                                  });
                                  Navigator.pop(context);
                                },
                                child: Text("Ya"),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Tidak"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text("Dialog"),
                  ),
                  ElevatedButton(
                    onPressed: () => notifBerhasil(context, "Notifff"),
                    child: Text("Snackbar"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
