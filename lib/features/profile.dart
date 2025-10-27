import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Halaman Profil: menampilkan foto, biodata, dan tombol media sosial
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Page')),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian header: foto profil dan nama
            const ProfileHeader(
              name: 'Wahyu Akhmad Fadillah',
              imageUrl:
                  'https://res.cloudinary.com/dxurnpbrc/image/upload/v1755188916/6_si5cfa.png',
            ),

            const SizedBox(height: 20),

            // Biodata sederhana
            const Text("NIM: 23090118", style: TextStyle(fontSize: 16)),
            const Text(
              "SLTA: SMK 1 Muhammadiyah 1 Tegal",
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              "SLTP: SMP Negri 220 Jakarta",
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              "SD: SD Muhammadiyah Grogol",
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              "MOTTO: Jangan Lupa Makan",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 30),

            // Bagian tombol sosial media
            const SocialButtons(),
          ],
        ),
      ),
    );
  }
}

// Komponen header profil: foto bundar + nama pengguna
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required this.name, required this.imageUrl});

  final String name;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary; // Warna utama theme
    return Row(
      children: [
        // Avatar dengan border warna theme
        Container(
          width: 84,
          height: 84,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: primary, width: 3),
          ),
          child: ClipOval(
            child: Image.network(
              imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 20),
        // Nama pengguna
        Text(
          name,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

// Komponen tombol-tombol sosial media (GitHub, Instagram, dll)
class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Baris pertama: GitHub dan Instagram
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.github, size: 24),
                label: const Text('Github'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.instagram, size: 24),
                label: const Text('Instagram'),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        // Baris kedua: X (Twitter) dan Facebook
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.twitter, size: 24),
                label: const Text('X'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.facebook, size: 24),
                label: const Text('Facebook'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
