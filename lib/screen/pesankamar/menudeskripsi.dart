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
  DateTime? checkInDate;
  DateTime? checkOutDate;

  void _showCheckinDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          backgroundColor: const Color(0xFF4C5C88),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _dateBox(Icons.calendar_today, "Check-in", checkInDate, (picked) {
                  setState(() => checkInDate = picked);
                }),
                const SizedBox(height: 12),
                _dateBox(Icons.calendar_today, "Check-out", checkOutDate, (picked) {
                  setState(() => checkOutDate = picked);
                }),
                const SizedBox(height: 12),
                _locationBox(),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (checkInDate != null &&
                          checkOutDate != null &&
                          checkOutDate!.isAfter(checkInDate!)) {
                        Navigator.pop(context);
                        Navigator.pushNamed(
                          context,
                          '/pembayaran',
                          arguments: {'totalHarga': totalHarga},
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please select valid check-in and check-out dates")),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text("Confirm", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _dateBox(IconData icon, String label, DateTime? date, Function(DateTime) onPicked) {
    return InkWell(
      onTap: () async {
        DateTime? picked = await showDatePicker(
          context: context,
          initialDate: date ?? DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365)),
        );
        if (picked != null) onPicked(picked);
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(icon, size: 20),
            const SizedBox(width: 12),
            Text(
              date != null ? formatDate(date) : label,
              style: TextStyle(
                color: date != null ? Colors.black : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatDate(DateTime date) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    String day = date.day.toString().padLeft(2, '0');
    String month = months[date.month - 1];
    String year = date.year.toString();
    return '$day $month $year';
  }

  Widget _locationBox() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Icon(Icons.location_on),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Seminyak, Bali", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text("Jl. Plawa Gg. Ratna No.13 D, Seminyak, Kec. Kuta, Kabupaten Badung, Bali 80361"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Center(
              child: Image.network('https://i.pinimg.com/736x/0b/9a/39/0b9a399f6284022da96fc0aa9a37c0c4.jpg', height: 40),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Image.asset(widget.imagePath, width: 300),
                  const SizedBox(width: 8),
                  Image.network('https://i.pinimg.com/736x/fd/16/32/fd163276e64fe3a76b3ea08490e641a9.jpg', width: 300),
                  const SizedBox(width: 8),
                  Image.network('https://i.pinimg.com/736x/09/66/c5/0966c5c293b81eb8294ef33a8f6ca97e.jpg', width: 300),
                  const SizedBox(width: 8),
                  Image.network('https://i.pinimg.com/736x/b4/ca/08/b4ca08cb7c80755298c6e5e04771e92b.jpg', width: 300),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(widget.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
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
                    decoration: BoxDecoration(color: Colors.grey[400], borderRadius: BorderRadius.circular(12)),
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
                Text("Rp $totalHarga", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(width: 4),
                const Text("Total Payment", style: TextStyle(fontWeight: FontWeight.bold)),
                const Spacer(),
                ElevatedButton(
                  onPressed: _showCheckinDialog,
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
