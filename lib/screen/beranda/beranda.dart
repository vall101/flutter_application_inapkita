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
          child: Image.network(
            imagePath,
            height: 100,
            width: 100,
            fit: BoxFit.cover,
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
                // Logo seperti di halaman login
                Center(
                  child: Image.network(
                    'https://i.imgur.com/SbeKTyI.png',
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                    semanticLabel: 'InapKita logo with a blue person shape and a white house inside',
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const CircularProgressIndicator();
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error, color: Colors.red);
                    },
                  ),
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
                  child: Image.network(
                    "https://i.pinimg.com/736x/84/f7/34/84f734b07a720ff604c8443118f34d7e.jpg",
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
                const SizedBox(height: 12),
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      buildTopSpotCard(
                        context,
                        "https://i.pinimg.com/736x/56/8b/eb/568bebd896ee3289d83af1900df44e19.jpg",
                        "Villa Bali",
                        "Beautiful villa with private pool in Bali",
                      ),
                      buildTopSpotCard(
                        context,
                        "https://i.pinimg.com/736x/28/9a/78/289a78e7b9b61f52c241901b394a2e1d.jpg",
                        "Ubud Cottage",
                        "Quiet and green environment for a peaceful stay",
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            "https://i.pinimg.com/736x/11/1f/a5/111fa5a3ff652c883ad09da3850e322b.jpg",
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
                  child: Image.network(
                    "https://i.pinimg.com/736x/56/dc/7c/56dc7c97d9f2710a59622cf48536afab.jpg",
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
