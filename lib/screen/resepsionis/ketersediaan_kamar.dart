import 'package:flutter/material.dart';

class KetersediaanKamarScreen extends StatefulWidget {
  @override
  _KetersediaanKamarScreenState createState() =>
      _KetersediaanKamarScreenState();
}

class _KetersediaanKamarScreenState extends State<KetersediaanKamarScreen> {
  final List<Map<String, dynamic>> kamarList = List.generate(18, (index) {
    int nomorKamar = 101 + index;
    return {
      'nomor': nomorKamar.toString(),
      'terisi': nomorKamar == 102,
    };
  });

  final Map<String, dynamic> dataTamu = {
    'nama': 'Jefri',
    'telepon': '+62 8881269765',
    'email': 'jefri@mail.com',
    'checkIn': '17-06-2025',
    'checkOut': '19-06-2025',
    'status': 'Check-in',
    'duration': '2 days',
    'nomorKamar': '102',
  };

  // Fungsi Menampilkan detail tamu
  void showDetailTamu(BuildContext context, String nomorKamar, bool terisi) {
    if (terisi) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: const Text('Detail Tamu'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/ujang.jpg'),
              ),
              const SizedBox(height: 10),
              Text(
                dataTamu['nama'],
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 5),
              Text('Telepon: ${dataTamu['telepon']}'),
              Text('Email: ${dataTamu['email']}'),
              const Divider(height: 20),
              Text('Check-in: ${dataTamu['checkIn']}'),
              Text('Check-out: ${dataTamu['checkOut']}'),
              Text('Status: ${dataTamu['status']}'),
              Text('Duration: ${dataTamu['duration']}'),
              Text('Kamar: ${dataTamu['nomorKamar']}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  final index = kamarList.indexWhere((k) => k['nomor'] == nomorKamar);
                  if (index != -1) kamarList[index]['terisi'] = false;
                });
              },
              child: const Text('Tandai Selesai'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Tutup'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: const Text('Informasi'),
          content: Text('Kamar $nomorKamar belum dipesan.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Tutup'),
            ),
          ],
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3E5A88),
      body: SafeArea(
        child: Column(
          children: [
            // Bagian atas logo dan judul
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(12),
              child: Center(
                child: Image.asset('assets/inapkita_logo.png', height: 40),
              ),
            ),
          ],
        ),
      ),
    );
    'nomorKamar': '104',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Tampilan Ketersediaan Kamar'),
      ),
    );
  }
}
