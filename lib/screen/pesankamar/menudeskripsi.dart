import 'package:flutter/material.dart';
import 'menudeskripsi2.dart';

class MenuDeskripsi extends StatefulWidget {
  @override
  State<MenuDeskripsi> createState() => _MenuDeskripsiState();
}

class _MenuDeskripsiState extends State<MenuDeskripsi> {
  bool isRoomInfoVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Center(child: Image.asset('assets/inapkita_logo.png', height: 40)),
            const SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Image.network('https://images.pexels.com/photos/2631746/pexels-photo-2631746.jpeg?auto=compress&cs=tinysrgb&w=600', width: 300),
                  const SizedBox(width: 8),
                  Image.network('https://images.pexels.com/photos/1454804/pexels-photo-1454804.jpeg?auto=compress&cs=tinysrgb&w=600', width: 300),
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
                  onPressed: () {},
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
                Navigator.push(context, MaterialPageRoute(builder: (_) => MenuDeskripsi2()));
              },
              icon: const Icon(Icons.local_offer, color: Colors.white),
              label: const Text("Use promo", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4C5C88),
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
                const Text("Rp 1.850.000", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(width: 4),
                const Text("Total Payment", style: TextStyle(fontWeight: FontWeight.bold)),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/pembayaran');
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
