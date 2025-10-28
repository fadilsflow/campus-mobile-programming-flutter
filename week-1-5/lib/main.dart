import 'package:flutter/material.dart';
import 'features/home.dart';
import 'features/profile.dart';

void main() {
  runApp(const CounterApp()); // Entry point Flutter app, jalankan widget utama
}

// widget utama aplikasi
class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App', // Nama aplikasi di task switcher
      theme: ThemeData(
        // Mengatur tema global, pakai Material 3 + warna utama cyan
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),

      // Routing dinamis untuk menangani navigasi berbasis nama
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            // Route utama -> tampilkan RootScaffold dengan tab Home aktif
            return MaterialPageRoute(
              builder: (_) => const RootScaffold(),
              settings: settings,
            );
          case '/profile':
            // Route ke Profile -> RootScaffold tapi langsung buka tab Profile
            return MaterialPageRoute(
              builder: (_) => const RootScaffold(initialIndex: 1),
              settings: settings,
            );
          default:
            // Fallback route -> kembali ke RootScaffold default
            return MaterialPageRoute(
              builder: (_) => const RootScaffold(),
              settings: settings,
            );
        }
      },
    );
  }
}

// widget utama yang menampung seluruh struktur tab (Home & Profile)
class RootScaffold extends StatefulWidget {
  const RootScaffold({super.key, this.initialIndex = 0});

  // Index awal tab (0 = Home, 1 = Profile)
  final int initialIndex;

  @override
  State<RootScaffold> createState() => _RootScaffoldState();
}

// State class untuk widget RootScaffold
class _RootScaffoldState extends State<RootScaffold> {
  // Menyimpan tab aktif saat ini, nilai awal dari initialIndex
  late int _index = widget.initialIndex;

  // Daftar halaman/tab yang ditampilkan
  final _pages = const [HomePage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Menampilkan halaman sesuai index aktif, menjaga state antar tab
      body: IndexedStack(index: _index, children: _pages),

      // BottomNavigationBar untuk berpindah antar tab
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index, // Tab aktif saat ini
        onTap: (i) => setState(() => _index = i), // Update tab saat dipilih
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
