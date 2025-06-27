import 'package:flutter/material.dart';

class KetersediaanKamarScreen extends StatefulWidget {
  const KetersediaanKamarScreen({super.key});

  @override
  State<KetersediaanKamarScreen> createState() => _KetersediaanKamarScreenState();
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
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage('https://i.imgur.com/jytf69h.jpeg'),
                onBackgroundImageError: (error, stackTrace) {
                debugPrint('Gagal memuat foto profil: $error');
              },
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Center(
                child: Image.network(
                  'https://i.imgur.com/otiEOBD.png', // Ganti dengan URL untuk foto profil
                  height: 40,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error),
                ),
              ),
              const SizedBox(height: 12),


            // Baris BackButton + Tulisan
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  BackButton(color: Colors.black),
                  const SizedBox(width: 8),
                  const Text(
                    'Ketersediaan Kamar',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Grid Kamar
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(45),
                decoration: const BoxDecoration(
                  color: Color(0xFF3E5A88),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: GridView.builder(
                  itemCount: kamarList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    final kamar = kamarList[index];
                    final nomor = kamar['nomor'];
                    final isTerisi = kamar['terisi'];

                    return GestureDetector(
                      onTap: () => showDetailTamu(context, nomor, isTerisi),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isTerisi ? Colors.green[400] : Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            )
                          ],
                        ),
                        child: Center(
                          child: Text(
                            nomor,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: isTerisi ? Colors.white : Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Grid kamar
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: GridView.builder(
                  itemCount: kamarList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.2,
                  ),
                  itemBuilder: (context, index) {
                    final kamar = kamarList[index];
                    return GestureDetector(
                      onTap: () => showDetailTamu(
                        context,
                        kamar['nomor'],
                        kamar['terisi'],
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kamar['terisi'] ? Colors.red[300] : Colors.green[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Kamar ${kamar['nomor']}',
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),),
    );
  }
}