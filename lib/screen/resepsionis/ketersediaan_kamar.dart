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
