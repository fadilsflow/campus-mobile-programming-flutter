import 'package:crud/pages/demodelete.dart';
import 'package:crud/pages/demoget.dart';
import 'package:crud/pages/demoputpatch.dart';
import 'package:crud/pages/demopost.dart';
import 'package:crud/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/demoget': (context) => const DemoGet(),
        '/demopost': (context) => const DemoPost(),
        '/demopatch': (context) => const DemoPutPatch(),
        '/demodelete': (context) => const DemoDelete(),
      },
      // home: HomePage(),
    );
  }
}
