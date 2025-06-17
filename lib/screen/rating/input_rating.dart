import 'package:flutter/material.dart';

class InputRating extends StatefulWidget {
  const InputRating({super.key});

  @override
  State<InputRating> createState() => _InputRatingState();
}

class _InputRatingState extends State<InputRating> {
  int _rating = 0;
  TextEditingController _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/logoinapkita.png',
              height: 30,
            ),
            const SizedBox(width: 8),
            Text(
              'InapKita',
              style: TextStyle(
                color: Colors.blue[800],
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/villa.jpg'),
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
            child: Image.asset('assets/room.jpg'),
          ),
          SizedBox(height: 16),

          // Review dan Rating
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
                        color: index < _rating ? Colors.amber : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _rating = index + 1;
                        });
                      },
                    );
                  }),
                ),
                Icon(Icons.emoji_emotions, color: Colors.blue),
              ],
            ),
          ),
        ],
      ),
    ); 
  }
}
//