import 'package:flutter/material.dart';
import 'add_property_page.dart';
import 'edit_property_page.dart';
import 'models/property_model.dart';
// import 'services/api_service.dart'; // akan dibuat

class PropertyDataPage extends StatelessWidget {
  const PropertyDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/inap_logo_2.png', height: 32),
            SizedBox(width: 8),
            Text('InapKita'),
          ],
        ),
      ),
      body: FutureBuilder<List<Property>>(
        future: Future.value([]), // TODO: ganti dengan ApiService().fetchProperties()
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Gagal memuat data property'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Belum ada data property'));
          }
          final properties = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
            itemCount: properties.length,
            itemBuilder: (context, i) => _buildPropertyCard(context, properties[i]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF4B5E93),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddPropertyPage()),
          );
        },
        child: const Icon(Icons.add, size: 36, color: Colors.white),
        tooltip: 'Tambah Property',
      ),
    );
  }

  Widget _buildPropertyCard(BuildContext context, Property property) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => EditPropertyPage(property: property.toMap()),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: property.image.isNotEmpty
                  ? Image.network(
                      property.image,
                      width: 80,
                      height: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 80,
                        height: 60,
                        color: Colors.grey[300],
                        child: const Icon(Icons.image_not_supported, color: Colors.grey),
                      ),
                    )
                  : Container(
                      width: 80,
                      height: 60,
                      color: Colors.grey[300],
                      child: const Icon(Icons.image, color: Colors.grey),
                    ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    property.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF222B45),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    property.address,
                    style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                  ),
                  if (property.desc != null && property.desc!.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      property.desc!,
                      style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Property {
  final String name;
  final String address;
  final String? desc;
  final String image;

  Property({
    required this.name,
    required this.address,
    this.desc,
    required this.image,
  });

  Map<String, dynamic> toMap() => {
        'name': name,
        'address': address,
        'desc': desc,
        'image': image,
      };
}
