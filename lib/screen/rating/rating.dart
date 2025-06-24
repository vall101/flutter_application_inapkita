import 'package:flutter/material.dart';

class Rating extends StatefulWidget {
  const Rating({super.key});

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? newReview =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    List<Map<String, dynamic>> reviews = [
      {'nama': 'Imbuh', 'komentar': 'Tempatnya sangat nyaman dan bersih', 'rating': 5},
      {'nama': 'Vanilaa', 'komentar': 'Tempatnya sangat luas dan fasilitasnya lengkap', 'rating': 5},
      {'nama': 'Nopal Pangestu', 'komentar': 'Tempatnya sangat aesthetic', 'rating': 4},
      {'nama': 'Imbuh 2', 'komentar': 'Fasilitas yang disediakan sangat bagus', 'rating': 5},
    ];

    if (newReview != null) {
      reviews.add(newReview);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
           Image.network(
              'https://i.imgur.com/otiEOBD.png',
              height: 70,
              errorBuilder: (context, error, stackTrace) {
               return Icon(Icons.error, color: Colors.red);
              },
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://www.topacapulcohotels.com/data/Pics/450x450w/16562/1656218/1656218557/pic-desa-di-bali-villas-kerobokan-80361-kerobokan-bali-1.JPEG',
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.error, color: Colors.red);
                  },
                ),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'The Villa in Bali',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Text(' 4.8 (36k+ reviews)', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ],
          ),
          
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.location_on, color: Colors.black),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Seminyak, Bali\nJl. Plawa Gg. Ratna No.13 D, Seminyak, Kec. Kuta, Kabupaten Badung, Bali 80361',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              'https://instapay.id/blog/wp-content/uploads/2023/05/penginapan-1024x682.jpg',
              height: 180,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error, color: Colors.red);
              },
            ),
          ),
          SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Review and Rating The Villa in Bali',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return IconButton(
                      icon: Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onPressed: () {
                        setState(() {});
                      },
                    );
                  }),
                ),
                Icon(Icons.emoji_emotions, color: Colors.blue),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Review Traveler The Villa in Bali',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 16),
                Column(
                  children: reviews
                      .map((r) => _buildReviewItem(r['nama'], r['komentar'], r['rating']))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
      //bottomnavigation
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xFF3E5A88),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewItem(String nama, String komentar, int rating) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text(
              nama.trim().isNotEmpty ? nama.trim()[0].toUpperCase() : '',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nama, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(komentar, style: const TextStyle(color: Colors.black54)),
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      Icons.star,
                      color: index < rating ? Colors.amber : Colors.grey[300],
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
