import 'package:flutter/material.dart';

class MenuPembayaran2 extends StatefulWidget {
  final int totalHarga;

  const MenuPembayaran2({super.key, required this.totalHarga});

  @override
  State<MenuPembayaran2> createState() => _MenuPembayaran2State();
}

class _MenuPembayaran2State extends State<MenuPembayaran2> {
  @override
  void initState() {
    super.initState();

    // Tampilkan popup saat halaman dibuka
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => OrderSuccessPopup(totalHarga: widget.totalHarga),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Image.network(
              'https://i.imgur.com/otiEOBD.png', // Logo InapKita
              height: 50,
            ),
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://i.imgur.com/XTpB6ae.jpeg',
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
          const Text("Price Details", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          const Text("Room Price"),
          const Text("Exclusive Room With 1 Queen Bed - Without Breakfast (1 malam)",
              style: TextStyle(color: Colors.grey)),
          const Divider(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Total Price", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Text("Rp ${widget.totalHarga}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ],
          ),
        ],
      ),
    );
  }
}

class OrderSuccessPopup extends StatelessWidget {
  final int totalHarga;

  const OrderSuccessPopup({super.key, required this.totalHarga});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Order Successful", style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(width: 6),
                    Icon(Icons.check_circle, color: Colors.green),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text("The Villa in Bali", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://i.imgur.com/XTpB6ae.jpeg',
                height: 80,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Exclusive Room With 1 Queen Bed - Without Breakfast (1 malam)",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 6),
            Text(
              "Room Price\nRp $totalHarga",
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Divider(height: 30),
            const Text("Hi Dear, Thanks For Order <3"),
            const SizedBox(height: 4),
            const Text("Check your booking history for the order", textAlign: TextAlign.center),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/riwayat');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text("Details", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}