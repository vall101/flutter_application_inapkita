import 'package:flutter/material.dart';
import '/screen/diskon/menudiskon.dart';
import 'menudeskripsi2.dart';

class MenuDeskripsi extends StatefulWidget {
  final String title;
  final String description;
  final String imagePath;

  const MenuDeskripsi({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  State<MenuDeskripsi> createState() => _MenuDeskripsiState();
}

class _MenuDeskripsiState extends State<MenuDeskripsi> {
  bool isRoomInfoVisible = true;
  int totalHarga = 1850000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Center(
              child: Image.network(
                'https://i.imgur.com/otiEOBD.png',
                height: 40,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Image.asset(widget.imagePath, width: 300),
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
            Text(widget.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Exclusive Room", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(widget.description),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (isRoomInfoVisible)
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
                          onTap: () => setState(() => isRoomInfoVisible = false),
                          child: const Icon(Icons.close, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/review');
                  },
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
              onPressed: () async {
                final promoHarga = await Navigator.push<int>(
                  context,
                  MaterialPageRoute(builder: (_) => const MenuDiskonPage()),
                );
                if (promoHarga != null) {
                  setState(() {
                    totalHarga = promoHarga;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MenuDeskripsi2(
                        totalHarga: promoHarga,
                        diskonPersen: 10,
                      ),
                    ),
                  );
                }
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
                  child: Row(
                    children: const [
                      Icon(Icons.chat_bubble_outline, size: 28),
                      SizedBox(width: 4),
                    ],
                  ),
                ),
                Text("Rp ${totalHarga.toString()}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(width: 4),
                const Text("Total Payment", style: TextStyle(fontWeight: FontWeight.bold)),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/pembayaran',
                      arguments: {'totalHarga': totalHarga},
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
