import 'package:flutter/material.dart';

// Import semua screen yang dibutuhkan
import 'screen/resepsionis/resepsionis.dart';
import 'screen/beranda/beranda.dart';
import 'screen/beranda/riwayat_pesan.dart';
import 'screen/beranda/kosong.dart';
import 'screen/beranda/profile.dart';
import 'screen/pesankamar/menupembayaran.dart';
import 'screen/pesankamar/menupembayaran2.dart';
import 'screen/pesankamar/menudeskripsi.dart';
import 'screen/pesankamar/menudeskripsi2.dart';
import 'screen/login/login_selection_screen.dart';
import 'screen/rating/rating.dart';
import 'screen/rating/input_rating.dart';

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
        '/resepsionis': (context) => const ResepsionisHome(),
        '/deskripsi': (context) => const MenuDeskripsi(),
        '/deskripsi2': (context) => const MenuDeskripsi2(),
        '/chatAdmin': (context) => const ChatAdminPage(),
        '/pembayaran': (context) => const MenuPembayaran(),
        '/pembayaran2': (context) => const MenuPembayaran2(),
        '/pesanKamar': (context) => const PesanKamarPage(),
        '/inputRating': (context) => const InputRating(),
        '/rating': (context) => const Rating(),
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
    const BerandaPage(),
    const RiwayatPemesananPage(),
    const NotFoundPage(),
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
