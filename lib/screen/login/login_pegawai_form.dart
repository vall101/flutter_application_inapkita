import 'package:flutter/material.dart';


class InapKitaLoginApp extends StatelessWidget {
  const InapKitaLoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InapKita Login',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 94, 103, 171),
        fontFamily: 'Inter',
        // Menambahkan skema warna untuk konsistensi di seluruh aplikasi
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 94, 103, 171)),
        useMaterial3: true,
      ),
      home: const LoginPegawai(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPegawai extends StatefulWidget {
  const LoginPegawai({super.key});

  @override
  State<LoginPegawai> createState() => _LoginPegawaiState();
}

class _LoginPegawaiState extends State<LoginPegawai> {
  // State untuk menyembunyikan atau menampilkan kata sandi
  bool _obscurePassword = true;
  // GlobalKey untuk validasi form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Mengambil warna utama dari tema
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
  backgroundColor: const Color.fromARGB(255, 94, 103, 171),
  elevation: 0,
  automaticallyImplyLeading: true,
  centerTitle: true,
  title: Padding(
    padding: const EdgeInsets.only(top: 1.0),
    child: Center(
      child: Image.network(
        'https://i.imgur.com/IeE0SSZ.png',
        width: 150,
        height: 100,
        fit: BoxFit.contain,
        semanticLabel: 'InapKita logo',
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(strokeWidth: 2),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.error, color: Colors.red);
        },
      ),
    ),
  ),
),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Log In Page',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 94, 103, 171),
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 24),

                // Label untuk field Email
                const Text(
                  'Email',
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: primaryColor, width: 2),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  ),
                  // Validator untuk memastikan input email tidak kosong dan valid
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email wajib diisi';
                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                        .hasMatch(value)) {
                      return 'Email tidak valid';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // Label untuk field Kata Sandi
                const Text(
                  'Kata sandi',
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    hintText: 'Kata sandi',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: primaryColor, width: 2),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    // Ikon untuk menampilkan/menyembunyikan kata sandi
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.grey[600],
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      tooltip: _obscurePassword
                          ? 'Tampilkan kata sandi'
                          : 'Sembunyikan kata sandi',
                    ),
                  ),
                  // Validator untuk memastikan kata sandi tidak kosong
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Kata sandi wajib diisi';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 8),
                // SizedBox ini sepertinya duplikat, bisa dihapus jika tidak diperlukan
                const SizedBox(height: 16),

                // Tombol Login
                ElevatedButton(
                  onPressed: () {
                    // Jalankan validasi form sebelum melanjutkan
                    if (_formKey.currentState!.validate()) {
                      // Jika valid, tampilkan pesan berhasil
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Login berhasil')),
                      );
                      // TODO: Tambahkan logika login sesungguhnya di sini
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 94, 103, 171),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
