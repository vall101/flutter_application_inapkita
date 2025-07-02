import 'package:flutter/material.dart';
import '../widget/riwayat.dart';
import '/screen/beranda/beranda.dart'; 
import '/screen/diskon/menudiskon.dart'; 
import '/screen/beranda/profile.dart'; 

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
                    imagePath: 'https://i.pinimg.com/736x/6e/ac/2a/6eac2ae7668708f5c306d6030a557d78.jpg',
                    title:
                        'The Villa in Bali - Jl. Plawa Gg. Ratna No.13 D, Seminyak, Kuta, Bali 80361',
                    date: '1 Januari 2025',
                    totalOrder: 'Rp 1.850.000',
                  ),
                  RiwayatCard(
                    imagePath: 'https://i.pinimg.com/736x/84/f7/34/84f734b07a720ff604c8443118f34d7e.jpg',
                    title:
                        'Seminyak Square Hotel - Jl. Kayu Aya No.10, Seminyak, Bali 80361',
                    date: '3 Januari 2025',
                    totalOrder: 'Rp 2.790.000',
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
