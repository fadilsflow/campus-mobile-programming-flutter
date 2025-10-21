import 'package:flutter/material.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int nilai = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Counter App')),
        body: Center(
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
            ],
          ),
        ),
      ),
    );
  }
}
