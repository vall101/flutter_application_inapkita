import 'package:flutter/material.dart';
import 'screen/pesankamar/menupembayaran.dart';
import 'screen/pesankamar/menupembayaran2.dart';
import 'screen/pesankamar/menudeskripsi.dart';
import 'screen/pesankamar/menudeskripsi2.dart';
import 'package:flutter_application_inapkita/screen/login/login_selection_screen.dart';


//
void main() {
  runApp(InapKitaApp());
}

class InapKitaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InapKita',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => MenuDeskripsi(),
        '/deskripsi2': (context) => MenuDeskripsi2(),
        '/chatAdmin': (context) => ChatAdminPage(),
        '/pembayaran': (context) => MenuPembayaran(),
        '/pembayaran2': (context) => MenuPembayaran2(),
      },
      home: LoginSelectionScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ChatAdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat Admin')),
      body: Center(child: Text('Ini halaman chat ke admin')),
    );
  }
}

class PesanKamarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pesan Kamar')),
      body: Center(child: Text('Ini halaman pemesanan kamar')),
    );
  }
}