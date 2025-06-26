import 'package:flutter/material.dart';
import 'create_resepsionis_page.dart';
import 'edit_resepsionis_page.dart';
// import 'services/api_service.dart'; // akan dibuat

class ResepsionisPage extends StatelessWidget {
  const ResepsionisPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3B5998),
        title: const Text(
          'Data Resepsionis',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder<List<Resepsionis>>( // ambil dari API
        future: Future.value([]), // TODO: ganti dengan ApiService().fetchResepsionis()
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Gagal memuat data resepsionis'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Belum ada data resepsionis'));
          }
          final resepsionisList = snapshot.data!;
          // Group by city jika perlu, untuk sekarang tampilkan flat list
          return ListView.builder(
            padding: const EdgeInsets.all(12.0),
            itemCount: resepsionisList.length,
            itemBuilder: (context, i) => _buildResepsionisCard(resepsionisList[i]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF3B5998),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateResepsionisPage()),
          );
        },
        child: const Icon(Icons.add, size: 32),
      ),
    );
  }

  Widget _buildResepsionisCard(Resepsionis r) {
    String shiftLabel = (r.shift?.toLowerCase() == 'malam') ? 'Shift Malam' : 'Shift Siang';
    return Builder(
      builder: (context) => Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey.shade500,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () async {
                    final confirm = await showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Edit Data Resepsionis'),
                        content: const Text('Ingin mengedit data resepsionis ini?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: const Text('Batal'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: const Text('Edit'),
                          ),
                        ],
                      ),
                    );
                    if (confirm == true) {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditResepsionisPage(
                            namaAwal: r.name,
                            teleponAwal: r.phone,
                            emailAwal: r.email,
                            shiftAwal: r.shift ?? '',
                          ),
                        ),
                      );
                    }
                  },
                  child: Text(
                    r.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Times New Roman',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4B5E93),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    shiftLabel,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Telepon:  ${r.phone}', style: const TextStyle(fontSize: 15)),
                      Text('Email:  ${r.email}', style: const TextStyle(fontSize: 15)),
                      if (r.shift != null)
                        Text('Shift: ${r.shift}', style: const TextStyle(fontSize: 15)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Resepsionis {
  final String name;
  final String image;
  final String phone;
  final String email;
  final String? shift;

  Resepsionis({
    required this.name,
    required this.image,
    required this.phone,
    required this.email,
    this.shift,
  });
}
