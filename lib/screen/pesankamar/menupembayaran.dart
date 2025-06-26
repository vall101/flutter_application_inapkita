import 'package:flutter/material.dart';
import 'menupembayaran2.dart';

class MenuPembayaran extends StatelessWidget {
  final int totalHarga;

  const MenuPembayaran({super.key, required this.totalHarga});

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
            const SizedBox(height: 16),

            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://instapay.id/blog/wp-content/uploads/2023/05/penginapan-1024x682.jpg',
              ),
            ),
            const SizedBox(height: 16),

            const Center(
              child: Text(
                "The Villa in Bali",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),

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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total Price",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "Rp $totalHarga",
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 24),

            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF4C5C88),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Column(
                children: [
                  buildPaymentMethod(
                    'https://buatlogoonline.com/wp-content/uploads/2022/10/Logo-Bank-BRI.png',
                    'BRI Virtual Account',
                  ),
                  const SizedBox(height: 12),
                  buildPaymentMethod(
                    'https://asset-2.tstatic.net/bangka/foto/bank/images/20220117-logo-bca.jpg',
                    'BCA',
                  ),
                  const SizedBox(height: 12),
                  buildPaymentMethod(
                    'https://cdn.idntimes.com/content-images/post/20240430/livin-by-mandiri-d26f696e05b637e5c8f4878f7f040f96.png',
                    'Livin’ by Mandiri',
                  ),
                  const SizedBox(height: 12),
                  buildPaymentMethod(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/Logo_dana_blue.svg/2560px-Logo_dana_blue.svg.png',
                    'Dana',
                  ),
                  const SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => MenuPembayaran2(totalHarga: totalHarga),
                          ),
                        );
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

  Widget buildPaymentMethod(String imageUrl, String label) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Row(
        children: [
          Image.network(imageUrl, height: 32),
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
