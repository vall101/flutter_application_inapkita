import 'package:flutter/material.dart';
import 'menupembayaran2.dart';

class MenuPembayaran extends StatefulWidget {
  final int totalHarga;

  const MenuPembayaran({super.key, required this.totalHarga});

  @override
  State<MenuPembayaran> createState() => _MenuPembayaranState();
}

class _MenuPembayaranState extends State<MenuPembayaran> {
  String? selectedPayment;

  final List<Map<String, dynamic>> paymentMethods = [
    {
      "name": "BRI Virtual Account",
      "icon": "https://i.imgur.com/TMCDPWz.jpeg",
      "value": "BRI"
    },
    {
      "name": "BCA",
      "icon": "https://i.imgur.com/Mm9isGx.png",
      "value": "BCA"
    },
    {
      "name": "Livin’ by Mandiri",
      "icon": "https://i.imgur.com/amuD90E.png",
      "value": "Mandiri"
    },
    {
      "name": "Dana",
      "icon": "https://i.imgur.com/Khv9OHQ.png",
      "value": "Dana"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Center(child: Image.network('https://i.pinimg.com/736x/84/f7/34/84f734b07a720ff604c8443118f34d7e.jpg', height: 50)),
            Center(
              child: Image.network(
                'https://i.imgur.com/otiEOBD.png', // logo InapKita
                height: 50,
              ),
            ),
            const SizedBox(height: 12),

            // Gambar villa
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://i.imgur.com/XTpB6ae.jpeg', // gambar villa 
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              "The Villa in Bali",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Detail harga
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Price Details", style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text("Room Price"),
                  Text("Exclusive Room With 1 Queen Bed - Without Breakfast (1 malam)"),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Total harga setelah diskon
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total Price", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(
                    "Rp ${widget.totalHarga}",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Metode pembayaran
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF3E4A75),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: paymentMethods.map((method) {
                  bool isSelected = selectedPayment == method["value"];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPayment = method["value"];
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.white : Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Image.network(method["icon"], width: 30),
                          const SizedBox(width: 12),
                          Text(
                            method["name"],
                            style: TextStyle(
                              fontSize: 16,
                              color: isSelected ? Colors.black : Colors.black45,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 20),

            // Tombol Payment
            ElevatedButton(
              onPressed: selectedPayment != null
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MenuPembayaran2(totalHarga: widget.totalHarga),
                        ),
                      );
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[800],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text("Payment", style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}