import 'package:flutter/material.dart';
import '/screen/beranda/beranda.dart';
import '/screen/beranda/riwayat_pesan.dart';
import '/screen/diskon/menudiskon.dart'; 

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text('InapKita'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        width: screenWidth, // ✅ Mengikuti lebar layar
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView( // ✅ Tambahkan scroll agar tidak overflow
          child: Column(
            children: [
              const SizedBox(height: 12),
              CircleAvatar(
                radius: screenWidth * 0.15, // ✅ Ukuran avatar proporsional
                backgroundColor: Colors.grey[300],
                backgroundImage: const AssetImage('assets/images/profile.png'),
              ),
              const SizedBox(height: 12),
              const Text(
                'User Name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              const Text(
                '+62 89749268',
                style: TextStyle(color: Colors.grey),
              ),
              const Text(
                'namapengguna@gmail.com',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              _buildMenuItem(Icons.location_on, 'Locations'),
              _buildMenuItem(Icons.account_balance_wallet, 'My Wallet'),
              _buildMenuItem(Icons.settings, 'Setting'),
              _buildMenuItem(Icons.logout, 'Sign Out'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue[700],

        unselectedItemColor: Colors.grey,
        currentIndex: 0,
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

  Widget _buildMenuItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title, style: const TextStyle(fontSize: 14)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
