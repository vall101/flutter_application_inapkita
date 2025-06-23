import 'package:flutter/material.dart';

class MenuPembayaran extends StatelessWidget {
  const MenuPembayaran({super.key, required int totalHarga});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Logo
            Center(
              child: Image.asset(
                'assets/images/inapkita_logo.png',
                height: 40,
              ),
            ),
            const SizedBox(height: 16),

            // Gambar kamar
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset('assets/images/kamar1.jpg'),
            ),
            const SizedBox(height: 16),

            // Judul villa
            const Center(
              child: Text(
                "The Villa in Bali",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),

            // Price Detail Section
            const Text(
              "Price Details",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              "Room Price",
              style: TextStyle(fontSize: 14),
            ),
            const Text(
              "Exclusive Room With 1 Queen Bed - Without Breakfast (1 malam)",
              style: TextStyle(color: Colors.grey),
            ),
            const Divider(height: 32),

            // Total Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Total Price",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "Rp 1.850.000",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Payment Methods Section
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF4C5C88),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Column(
                children: [
                  buildPaymentMethod('assets/images/bri.png', 'BRI Virtual Account'),
                  const SizedBox(height: 12),
                  buildPaymentMethod('assets/images/bca.png', 'BCA'),
                  const SizedBox(height: 12),
                  buildPaymentMethod('assets/images/mandiri.png', 'Livin’ by Mandiri'),
                  const SizedBox(height: 12),
                  buildPaymentMethod('assets/images/dana.png', 'Dana'),
                  const SizedBox(height: 24),

                  // Tombol Payment
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/pembayaran2');
                        // Aksi ketika tombol ditekan
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[700],
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Payment",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget metode pembayaran
  Widget buildPaymentMethod(String imagePath, String label) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Row(
        children: [
          Image.asset(imagePath, height: 32),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
