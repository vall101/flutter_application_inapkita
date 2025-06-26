import 'package:flutter/material.dart';
import '/screen/diskon/menudiskon.dart';
import 'menupembayaran.dart';

class MenuDeskripsi2 extends StatelessWidget {
  final int totalHarga;
  final int diskonPersen;

  const MenuDeskripsi2({
    super.key,
    required this.totalHarga,
    required this.diskonPersen,
  });

  @override
  Widget build(BuildContext context) {
    final int hargaNormal = 1850000;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Logo pakai image.network
            Center(
              child: Image.network(
                'https://i.imgur.com/otiEOBD.png', // Logo InapKita
                height: 40,
              ),
            ),
            const SizedBox(height: 12),

            // Gambar villa 
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Image.network(
                    'https://semenmerahputih.com/_ipx/f_webp/https://cms.semenmerahputih.com/storage/4878/conversions/desain-kamar-mandi-converted.jpg',
                    width: 300,
                  ),
                  const SizedBox(width: 8),
                  Image.network(
                    'https://instapay.id/blog/wp-content/uploads/2023/05/penginapan-1024x682.jpg',
                    width: 300,
                  ),
                  const SizedBox(width: 8),
                  Image.network(
                    'https://www.saniharto.com/assets/gallery/3d-rendering-modern-interior-designjpg.jpeg',
                    width: 300,
                  ), 
                  const SizedBox(width: 8),
                  Image.network(
                    'https://editorial.femaledaily.com/wp-content/uploads/2022/06/tips-mudah-dekor-dapur-dan-ruang-makan-dari-IKEA-1.jpg',
                    width: 300,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            const Text("The Villa in Bali", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Exclusive Room", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(
                    "This is one type of villa at Exclusive Bali that can accommodate 3 people and is free of 2 children under 10 years old. This type is equipped with 2 queen-size beds (160 × 200 cm), a private swimming pool, kitchen, bathtub, air conditioner, gazebo, bathroom with water heater, smart TV with Netflix, and complete amenities.\n\n"
                    "This is one type of villa at Bohemian Jogja Villas that can accommodate 3 person and free of charge for 2 children (less than 10 y.o). This type equipped with 2 queen bed, private pool, kitchen, Bath tub, Air conditioner, private gazebo, bathroom with water heater, smartTV with netflix, and full amenities",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    children: [
                      const Text("Room available\n2 rooms available currently", style: TextStyle(color: Colors.white)),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.close, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/review'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text("Check Review"),
                ),
              ],
            ),
            const SizedBox(height: 16),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MenuDiskonPage()),
                );
              },
              icon: const Icon(Icons.local_offer, color: Colors.white),
              label: const Text("Use promo", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4C5C88),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pushNamed(context, '/chatAdmin'),
                  child: const Row(
                    children: [
                      Icon(Icons.chat_bubble_outline, size: 28),
                      SizedBox(width: 4),
                    ],
                  ),
                ),
                const SizedBox(width: 8), // Add spacing between chat and price info
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$diskonPersen%",
                      style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Rp 1850000",
                      style: TextStyle(decoration: TextDecoration.lineThrough),
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                Text(
                  "Rp Rp $hargaNormal",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 4),
                const Text("Total Payment", style: TextStyle(fontWeight: FontWeight.bold)),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MenuPembayaran(
                          totalHarga: totalHarga,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  ),
                  child: const Text("Reservation"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
