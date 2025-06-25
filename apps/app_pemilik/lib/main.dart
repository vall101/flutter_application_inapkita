import 'package:flutter/material.dart';
import 'splash_page.dart';

void main() {
  runApp(const MyApp()); // Gunakan const untuk optimalisasi
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Tambahkan const constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InapKita',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF3B5998),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3B5998),
          primary: const Color(0xFF3B5998),
          secondary: const Color(0xFF4B5E93),
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F6FA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF3B5998),
          elevation: 2,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            letterSpacing: 1.1,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF3B5998),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
          elevation: 8,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4B5E93),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF4B5E93), width: 1.2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFB0B6C3), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF4B5E93), width: 2),
          ),
        ),
        fontFamily: 'Roboto',
      ),
      home: const SplashPage(),
    );
  }
}
// Saran lanjutan: Pastikan widget lain juga menggunakan const jika memungkinkan, dan lakukan analisa kode dengan 'flutter analyze' untuk menemukan potensi optimalisasi lain.
