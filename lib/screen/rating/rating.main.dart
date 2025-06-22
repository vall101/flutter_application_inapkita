import 'package:flutter/material.dart';
import 'rating.dart';
import 'input_rating.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InapKita',
      theme: ThemeData(primarySwatch: Colors.indigo, fontFamily: 'Arial'),
      initialRoute: '/inputRating', 
      routes: {
        '/inputRating': (context) => InputRating(),
        '/rating': (context) => Rating(),
      },
    );
  }
}

