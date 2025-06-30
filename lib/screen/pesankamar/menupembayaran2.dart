import 'package:flutter/material.dart';
import '/screen/beranda/beranda.dart'; 
import '/screen/beranda/riwayat_pesan.dart';
import '/screen/beranda/profile.dart';

class MenuDiskonPage extends StatelessWidget {
  const MenuDiskonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: 220,
            decoration: const BoxDecoration(
              color: Color(0xFF3E5A88),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 50, bottom: 80),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Discount Package',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.menu, color: Colors.white, size: 30),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF166AB2),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 6,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.local_offer, color: Colors.white, size: 30),
                      SizedBox(width: 12),
                      Text(
                        'Extra Discount',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shadowColor: Colors.black26,
                      elevation: 5,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 25),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'View my coupon',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: const [
                      Icon(Icons.card_giftcard, size: 30),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'User discount coupon: 10% off',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    _buildDiskonCard(context, '10% New User', 0.10),
                    _buildDiskonCard(context, '30% Special Deal', 0.30),
                    _buildDiskonCard(context, '50% Flash Sale', 0.50),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
  type: BottomNavigationBarType.fixed,
  selectedItemColor: Colors.blue[700],
  unselectedItemColor: Colors.grey,
  currentIndex: 2, // Icon diskon aktif
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
      // Tetap di halaman diskon
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

  static Widget _buildDiskonCard(BuildContext context, String title, double diskon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      child: InkWell(
        onTap: () => _navigateWithPromo(context, diskon),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.blueGrey[50],
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 3,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                '· 2x coupon discount - No Minimum Purchase',
                style: TextStyle(color: Colors.black54, fontSize: 13),
              )
            ],
          ),
        ),
      ),
    );
  }

  static void _navigateWithPromo(BuildContext context, double diskon) {
    double hargaNormal = 1850000;
    double hargaPromo = hargaNormal - (hargaNormal * diskon);

    Navigator.pushReplacementNamed(
      context,
      '/deskripsi2',
      arguments: {
        'totalHarga': hargaPromo.toInt(),
        'diskonPersen': (diskon * 100).toInt(),
      },
    );
  }
}
