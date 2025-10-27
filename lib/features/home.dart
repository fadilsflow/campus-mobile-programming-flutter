import 'package:flutter/material.dart';

// Halaman utama aplikasi (menampilkan counter)
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// berfungsi untuk menyimpan data dan logika milik widget HomePage.
class _HomePageState extends State<HomePage> {
  int nilai = 0; // State utama: nilai counter

  // Fungsi untuk menampilkan snackbar dengan nilai saat ini
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
        actions: [
          // Tombol info -> tampilkan nilai sekarang di snackbar
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => notifBerhasil(context, 'Nilai saat ini:'),
            tooltip: 'Tampilkan Snackbar',
          ),
          // Tombol reset -> buka dialog konfirmasi sebelum reset nilai
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              showDialog(
                context: context,
                builder: (dialogContext) {
                  return AlertDialog(
                    title: const Icon(Icons.warning),
                    content: const Text(
                      'Apakah anda yakin ingin mereset nilai?',
                    ),
                    actions: [
                      // Tombol "Ya" -> reset nilai ke 0 dan tutup dialog
                      TextButton(
                        onPressed: () {
                          setState(() {
                            nilai = 0;
                          });
                          Navigator.pop(dialogContext);
                        },
                        child: const Text('Ya'),
                      ),
                      // Tombol "Tidak" -> hanya tutup dialog
                      TextButton(
                        onPressed: () => Navigator.pop(dialogContext),
                        child: const Text('Tidak'),
                      ),
                    ],
                  );
                },
              );
            },
            tooltip: 'Reset',
          ),
        ],
      ),

      // Konten utama halaman
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            // Batasi lebar agar layout tetap proporsional di layar besar
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              // Gunakan widget terpisah untuk tampilan kartu counter
              child: CounterCard(
                value: nilai,
                onIncrement: () => setState(() => nilai += 1),
                onDecrement: () => setState(() => nilai -= 1),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Widget terpisah untuk menampilkan tampilan kartu counter
class CounterCard extends StatelessWidget {
  const CounterCard({
    super.key,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  });

  final int value; // Nilai counter yang ditampilkan
  final VoidCallback onIncrement; // Callback untuk tambah nilai
  final VoidCallback onDecrement; // Callback untuk kurang nilai

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Nilai Counter',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            // Tampilkan nilai counter besar di tengah
            Text(
              '$value',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 56, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                // Tombol untuk mengurangi nilai
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onDecrement,
                    icon: const Icon(Icons.remove),
                    label: const Text('Kurang'),
                  ),
                ),
                const SizedBox(width: 12),
                // Tombol untuk menambah nilai
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: onIncrement,
                    icon: const Icon(Icons.add),
                    label: const Text('Tambah'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
