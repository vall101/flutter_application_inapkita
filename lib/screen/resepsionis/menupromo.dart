import 'package:flutter/material.dart';

class MenuDiskonPage extends StatelessWidget {
  const MenuDiskonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Latar belakang biru dengan lengkungan bawah
          Container(
            height: 220,
            decoration: const BoxDecoration(
              color: Color(0xFF3E5A88),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
