import 'package:flutter/material.dart';

class Resepsionis extends StatefulWidget {
  const Resepsionis({super.key});

  @override
  State<Resepsionis> createState() => _ResepsionisState();
}

class _ResepsionisState extends State<Resepsionis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text("InapKita")
        ],
      ),
    );
  }
}