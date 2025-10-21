import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Page')),
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 84,
                  height: 84,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.cyan, width: 3),
                  ),
                  child: ClipOval(
                    child: Image.network(
                      'https://res.cloudinary.com/dxurnpbrc/image/upload/v1755188916/6_si5cfa.png',
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                const Text(
                  "Wahyu Akhmad Fadillah",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            SizedBox(height: 20),

            Text("NIM: 14090070", style: TextStyle(fontSize: 16)),
            Text(
              "SLTA: SMK 1 Muhammadiyah 1 Tegal",
              style: TextStyle(fontSize: 16),
            ),
            Text("SLTP: SMP Negri 220 Jakarta", style: TextStyle(fontSize: 16)),
            Text("SD: SD Muhammadiyah Grogol", style: TextStyle(fontSize: 16)),
            Text("MOTTO: Jangan Lupa Makan", style: TextStyle(fontSize: 16)),
            SizedBox(height: 30),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(FontAwesomeIcons.github, size: 24),
                    label: const Text("Github"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(FontAwesomeIcons.instagram, size: 24),
                    label: const Text("Instagram"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(FontAwesomeIcons.twitter, size: 24),
                    label: const Text("X"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(FontAwesomeIcons.facebook, size: 24),
                    label: const Text("Facebook"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                    ),
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
