import 'package:flutter/material.dart';
import 'screen/resepsionis/resepsionis.dart';
import 'screen/beranda/beranda.dart';
import 'screen/beranda/riwayat_pesan.dart';
import 'screen/beranda/profile.dart';
import 'screen/pesankamar/menupembayaran.dart';
import 'screen/pesankamar/menupembayaran2.dart';
import 'screen/pesankamar/menudeskripsi.dart';
import 'screen/pesankamar/menudeskripsi2.dart';
import 'screen/login/login_selection_screen.dart';
import 'screen/rating/rating.dart';
import 'screen/rating/input_rating.dart';
import 'screen/diskon/menudiskon.dart';

void main() {
  runApp(const InapKitaApp());
}

class InapKitaApp extends StatelessWidget {
  const InapKitaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "InapKita",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginSelectionScreen(),
        '/main': (context) => const MainNavigation(),
        '/beranda': (context) => const Beranda(),
        '/resepsionis': (context) => const ResepsionisHome(),
        '/chatAdmin': (context) => const ChatAdminPage(),
        '/review': (context) => const Rating(),
        '/pesanKamar': (context) => const PesanKamarPage(),
        '/inputRating': (context) => const InputRating(),
        '/rating': (context) => const Rating(),
        '/diskon': (context) => const MenuDiskonPage(),
        '/pembayaran': (context) => const MenuPembayaran(totalHarga: 1850000),
        '/menupembayaran2': (context) => const MenuPembayaran2(totalHarga: 1850000),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/deskripsi') {
          final args = settings.arguments as Map<String, String>;
          return MaterialPageRoute(
            builder: (_) => MenuDeskripsi(
              title: args['title']!,
              description: args['description']!,
              imagePath: args['imagePath']!,
            ),
          );
        }

        if (settings.name == '/deskripsi2') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (_) => MenuDeskripsi2(
              totalHarga: args['totalHarga'],
              diskonPersen: args['diskonPersen'],
            ),
          );
        }

        if (settings.name == '/pembayaran') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (_) => MenuPembayaran(
              totalHarga: args['totalHarga'],
            ),
          );
        }

        if (settings.name == '/pembayaran2') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (_) => MenuPembayaran2(
              totalHarga: args['totalHarga'],
            ),
          );
        }

        return null;
      },
    );
  }
}

// === Navigasi bawah untuk user ===
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Beranda(),
    const RiwayatPemesananPage(),
    const MenuDiskonPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[900],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}

// === Halaman umum ===
class ChatAdminPage extends StatelessWidget {
  const ChatAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat Admin')),
      body: const Center(child: Text('Ini halaman chat ke admin')),
    );
  }
}

class PesanKamarPage extends StatelessWidget {
  const PesanKamarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pesan Kamar')),
      body: const Center(child: Text('Ini halaman pemesanan kamar')),
    );
  }
}