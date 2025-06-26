import 'package:flutter/material.dart';
import 'add_property_page.dart';
import 'property_data_page.dart';
import 'resepsionis_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget buildMenuCard(
    String title,
    String imagePath,
    VoidCallback onTap, {
    double aspectRatio = 1.5,
  }) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        elevation: 6,
        shadowColor: Colors.black26,
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          splashColor: const Color(0xFF4B5E93).withAlpha((255 * 0.2).toInt()),
          highlightColor: const Color(0xFF4B5E93).withAlpha((255 * 0.08).toInt()),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
                colorFilter: const ColorFilter.mode(Colors.black38, BlendMode.darken),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.all(18),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 4,
                    color: Colors.black87,
                    offset: Offset(1, 2),
                  ),
                ],
              ),
              textAlign: TextAlign.left,
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
        backgroundColor: const Color(0xFF3B5998),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/inap_logo_2.png', height: 32),
            const SizedBox(width: 8),
            const Text(
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
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            const SizedBox(height: 28),
            Center(
              child: Text(
                "Menu Pemilik",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4B5E93),
                  letterSpacing: 1.2,
                  shadows: [Shadow(blurRadius: 4, color: Colors.black26, offset: Offset(2, 2))],
                ),
              ),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    child: buildMenuCard(
                      "Add Property",
                      "assets/images/property1.jpg",
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => AddPropertyPage()),
                        );
                      },
                      aspectRatio: 1,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    child: buildMenuCard(
                      "Check Property",
                      "assets/images/property2.jpg",
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => PropertyDataPage()),
                        );
                      },
                      aspectRatio: 1,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: buildMenuCard(
                "Data Resepsionis",
                "assets/images/resepsionis.jpg",
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ResepsionisPage()),
                  );
                },
                aspectRatio: 2.1,
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
