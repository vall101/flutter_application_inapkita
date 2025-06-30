import 'package:flutter/material.dart';
import '/screen/diskon/menudiskon.dart';
import 'menupembayaran.dart';

class MenuDeskripsi2 extends StatefulWidget {
  final int totalHarga;
  final int diskonPersen;

  const MenuDeskripsi2({
    super.key,
    required this.totalHarga,
    required this.diskonPersen,
  });

  @override
  State<MenuDeskripsi2> createState() => _MenuDeskripsi2State();
}

class _MenuDeskripsi2State extends State<MenuDeskripsi2> {
  late int hargaDiskon;

  @override
  void initState() {
    super.initState();
    hargaDiskon = widget.totalHarga;
  }

  void _showReservationPopup() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => ReservationPopup(
        totalHarga: hargaDiskon,
        onConfirmed: (checkIn, checkOut) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MenuPembayaran(totalHarga: hargaDiskon),
            ),
          );
        },
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
              child: Image.network('https://i.imgur.com/otiEOBD.png', height: 40),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Image.network('https://semenmerahputih.com/_ipx/f_webp/https://cms.semenmerahputih.com/storage/4878/conversions/desain-kamar-mandi-converted.jpg', width: 300),
                  const SizedBox(width: 8),
                  Image.network('https://instapay.id/blog/wp-content/uploads/2023/05/penginapan-1024x682.jpg', width: 300),
                  const SizedBox(width: 8),
                  Image.network('https://www.saniharto.com/assets/gallery/3d-rendering-modern-interior-designjpg.jpeg', width: 300),
                  const SizedBox(width: 8),
                  Image.network('https://editorial.femaledaily.com/wp-content/uploads/2022/06/tips-mudah-dekor-dapur-dan-ruang-makan-dari-IKEA-1.jpg', width: 300),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text("The Villa in Bali", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Exclusive Room", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(
                    "This villa can accommodate 3 people and 2 free children under 10. It features 2 queen-size beds, private pool, kitchen, bathtub, AC, gazebo, water heater, smart TV with Netflix, and full amenities.",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.grey[400], borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    children: const [
                      Text("Room available\n2 rooms available currently", style: TextStyle(color: Colors.white)),
                      SizedBox(width: 8),
                      Icon(Icons.close, color: Colors.white),
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
                    hargaDiskon = promoHarga;
                  });
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
                const Icon(Icons.chat_bubble_outline, size: 28),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${widget.diskonPersen}%", style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                    const Text("Rp 1850000", style: TextStyle(decoration: TextDecoration.lineThrough)),
                  ],
                ),
                const SizedBox(width: 8),
                Text("Rp $hargaDiskon", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(width: 4),
                const Text("Total Payment", style: TextStyle(fontWeight: FontWeight.bold)),
                const Spacer(),
                ElevatedButton(
                  onPressed: _showReservationPopup,
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

class ReservationPopup extends StatefulWidget {
  final int totalHarga;
  final void Function(DateTime checkIn, DateTime checkOut) onConfirmed;

  const ReservationPopup({super.key, required this.totalHarga, required this.onConfirmed});

  @override
  State<ReservationPopup> createState() => _ReservationPopupState();
}

class _ReservationPopupState extends State<ReservationPopup> {
  DateTime? checkInDate, checkOutDate;

  String formatDate(DateTime? date) {
    if (date == null) return '';
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    final day = date.day.toString().padLeft(2, '0');
    final month = months[date.month - 1];
    final year = date.year;
    return '$day $month $year';
  }

  Future<void> pickDate({required bool isCheckIn}) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date == null) return;

    setState(() {
      if (isCheckIn) {
        checkInDate = date;
      } else {
        checkOutDate = date;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF4C5C88),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _dateButton("Check-in", checkInDate, () => pickDate(isCheckIn: true)),
          const SizedBox(height: 10),
          _dateButton("Check-out", checkOutDate, () => pickDate(isCheckIn: false)),
          const SizedBox(height: 10),
          _locationBox(),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (checkInDate != null && checkOutDate != null && checkOutDate!.isAfter(checkInDate!)) {
                  Navigator.pop(context);
                  widget.onConfirmed(checkInDate!, checkOutDate!);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please select valid check-in and check-out")),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[800],
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text("Confirm", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dateButton(String label, DateTime? date, VoidCallback onTap) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: const Icon(Icons.calendar_today, color: Colors.black),
      label: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          date == null ? label : formatDate(date),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 2,
        minimumSize: const Size(double.infinity, 50),
        alignment: Alignment.centerLeft,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Colors.grey),
        ),
      ),
    );
  }

  Widget _locationBox() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 1)),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Icon(Icons.location_on, size: 20),
            SizedBox(width: 6),
            Text("Seminyak, Bali"),
          ]),
          SizedBox(height: 6),
          Text("Jl. Plawa Gg. Ratna No.13 D,\nSeminyak, Kec. Kuta, Kabupaten Badung, Bali 80361", style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
