import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget buildMenuCard(
    String title,
    String imagePath,
    VoidCallback onTap, {
    double aspectRatio = 1.5,
  }) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  blurRadius: 2,
                  color: Colors.black45,
                  offset: Offset(1, 1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3B5998),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/inap_logo_2.png', height: 32),
            SizedBox(width: 8),
            Text(
              'InapKita',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            Center(
              child: Text(
                "Menu Pemilik",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF455B8A),
                  shadows: [Shadow(blurRadius: 1, color: Colors.black12)],
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: buildMenuCard(
                    "Add Property",
                    "assets/images/property1.jpg",
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => AddPropertyPage()),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: buildMenuCard(
                    "Check Property",
                    "assets/images/property2.jpg",
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => CheckPropertyPage()),
                      );
                    },
                  ),
                ),
              ],
            ),
            buildMenuCard(
              "Data Resepsionis",
              "assets/images/resepsionis.jpg",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ResepsionisPage()),
                );
              },
              aspectRatio: 3,
            ),
          ],
        ),
      ),
    );
  }
}

// ===== Dummy Pages =====
class AddPropertyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Property")),
      body: Center(child: Text("Halaman Tambah Properti")),
    );
  }
}

class CheckPropertyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Check Property")),
      body: Center(child: Text("Halaman Cek Properti")),
    );
  }
}

class ResepsionisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Data Resepsionis")),
      body: Center(child: Text("Halaman Data Resepsionis")),
    );
  }
}
