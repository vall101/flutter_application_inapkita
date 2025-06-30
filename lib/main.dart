import 'package:flutter/material.dart';
import '/screen/beranda/kosong.dart';
import '/screen/beranda/riwayat_pesan.dart';
import '/screen/diskon/menudiskon.dart';
import '/screen/beranda/profile.dart';
import '/screen/pesankamar/menudeskripsi.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  Widget buildTopSpotCard(
  BuildContext context,
  String imagePath,
  String title,
  String description,
) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MenuDeskripsi(
            title: title,
            description: description,
            imagePath: imagePath,
          ),
        ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.only(right: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: 
        Image.network(
          'https://i.imgur.com/XTpB6ae.jpeg',
            width: 300,
        ),
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    final themeColor = Colors.blue[700];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
  child: Image.network('https://i.imgur.com/otiEOBD.png', height: 40),
),
                const SizedBox(height: 12),
                const Text(
                  "Ready for a New\nAdventure?",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Discover new places, hidden gems, and unforgettable experiences!",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: "Search your destination",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    onSubmitted: (value) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NotFoundPage()),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  "Must-Visit Destinations",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    "assets/img1.jpg",
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  
                ),
                const SizedBox(height: 24),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Explore Top Spots",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.location_on, color: Colors.red),
                  ],
                ),
                SizedBox(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        buildTopSpotCard(
                          context,
                          "assets/img2.jpg",
                          "Villa Bali",
                          "Beautiful villa with private pool in Bali",
                        ),
                        buildTopSpotCard(
                          context,
                          "assets/img3.jpg",
                          "Ubud Cottage",
                          "Quiet and green environment for a peaceful stay",
                        ),
                        // Gambar ke-3 dan ke-4 tidak diklik, hanya sebagai tampilan biasa
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              "assets/img4.jpg",
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 24),
                const Text(
                  "Iconic Places to Visit",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    "assets/img5.jpg",
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: themeColor,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RiwayatPemesananPage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MenuDiskonPage()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}