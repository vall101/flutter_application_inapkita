import 'package:flutter/material.dart';
import '../widget/riwayat.dart';
import '/screen/beranda/beranda.dart'; // Pastikan path sesuai
import '/screen/diskon/menudiskon.dart'; // Pastikan path sesuai
import '/screen/beranda/profile.dart'; // Ganti sesuai lokasi file RiwayatPemesananPage



class RiwayatPemesananPage extends StatelessWidget {
  const RiwayatPemesananPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text('InapKita'),
        actions: [
          IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
        ],
      ),
      body: Container(
        width: screenWidth, // ✅ mengikuti lebar layar
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Riwayat Pemesanan',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView(
                children: const [
                  RiwayatCard(
                    imagePath: 'assets/images/contoh1.jpg',
                    title:
                        'The Villa in Bali - Jl. Plawa Gg. Ratna No.13 D, Seminyak, Kuta, Bali 80361',
                    date: '1 Januari 2025',
                    totalOrder: 'Rp 1.850.000',
                  ),
                  RiwayatCard(
                    imagePath: 'assets/images/contoh2.jpg',
                    title:
                        'Seminyak Square Hotel - Jl. Kayu Aya No.10, Seminyak, Bali 80361',
                    date: '3 Januari 2025',
                    totalOrder: 'Rp 2.790.000',
                  ),
                  RiwayatCard(
                    imagePath: 'assets/images/contoh1.jpg',
                    title:
                        'Rama Phala Resort & Spa - Jl. Pengosekan, Ubud, Gianyar, Bali 80571',
                    date: '5 Januari 2025',
                    totalOrder: 'Rp 3.850.000',
                  ),
                  RiwayatCard(
                    imagePath: 'assets/images/contoh2.jpg',
                    title:
                        'Pradha Villas - Jl. Kayu Jati No. 5 Seminyak, Kuta, Bali 80361',
                    date: '8 Januari 2025',
                    totalOrder: 'Rp 5.850.000',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue[700],
        unselectedItemColor: Colors.grey,
        currentIndex: 1,
        onTap: (index) {
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Beranda()),
              );
            } else if (index == 1) {
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
