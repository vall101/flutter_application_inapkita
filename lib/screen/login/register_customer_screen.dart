import 'package:flutter/material.dart';

void main() {
  runApp(const InapKitaApp());
}

class InapKitaApp extends StatelessWidget {
  const InapKitaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar InapKita',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 94, 103, 171),
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 94, 103, 171),
        ),
        useMaterial3: true,
      ),
      home: const RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String _selectedCountryCode = '+62';
  bool _passwordVisible1 = false;
  bool _passwordVisible2 = false;

  final List<String> _countryCodes = ['+62', '+1', '+44'];

  @override
  void dispose() {
    // Selalu dispose controller untuk menghindari memory leak
    _usernameController.dispose();
    _fullNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // Fungsi helper untuk membuat InputDecoration agar tidak berulang
  InputDecoration _inputDecoration(String placeholder, {Widget? suffixIcon}) {
    return InputDecoration(
      filled: true,
      fillColor: const Color(0xFFCBD2E1),
      hintText: placeholder,
      hintStyle: const TextStyle(
        color: Color(0xFF8A8A8A),
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF9CA3AF)),
        borderRadius: BorderRadius.circular(4),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF9CA3AF)),
        borderRadius: BorderRadius.circular(4),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(4),
      ),
      suffixIcon: suffixIcon,
    );
  }

  // Widget untuk dropdown kode negara
  Widget _buildCountryCodeDropdown() {
    return Container(
      width: 80,
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFCBD2E1),
        border: Border.all(color: const Color(0xFF9CA3AF)),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.only(left: 8, right: 4),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedCountryCode,
          icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF8A8A8A)),
          style: const TextStyle(
            color: Color(0xFF8A8A8A),
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
          onChanged: (String? newValue) {
            if (newValue != null) {
              setState(() {
                _selectedCountryCode = newValue;
              });
            }
          },
          items: _countryCodes.map<DropdownMenuItem<String>>((String code) {
            return DropdownMenuItem<String>(
              value: code,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(
                    _flagUrl(code),
                    width: 20,
                    height: 15,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const SizedBox(width: 20, height: 15),
                  ),
                  const SizedBox(width: 4),
                  Flexible(
                    child: Text(
                      code,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  // Mendapatkan URL bendera berdasarkan kode negara
  String _flagUrl(String code) {
    switch (code) {
      case '+62':
        return 'https://flagcdn.com/w20/id.png';
      case '+1':
        return 'https://flagcdn.com/w20/us.png';
      case '+44':
        return 'https://flagcdn.com/w20/gb.png';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 8),
                const Text(
                  'Create Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 94, 103, 171),
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _usernameController,
                  decoration: _inputDecoration('Username *'),
                  style: const TextStyle(
                    color: Color(0xFF8A8A8A),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username wajib diisi';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _fullNameController,
                  decoration: _inputDecoration('Nama Lengkap'),
                  style: const TextStyle(
                    color: Color(0xFF8A8A8A),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    SizedBox(
                      width: 90,
                      child: _buildCountryCodeDropdown(),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: _inputDecoration('Nomor Telepon'),
                        style: const TextStyle(
                          color: Color(0xFF8A8A8A),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _inputDecoration('Email *'),
                  style: const TextStyle(
                    color: Color(0xFF8A8A8A),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email wajib diisi';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Format email tidak valid';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: !_passwordVisible1,
                  decoration: _inputDecoration(
                    'Password *',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible1
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: const Color(0xFF8A8A8A),
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible1 = !_passwordVisible1;
                        });
                      },
                    ),
                  ),
                  style: const TextStyle(
                    color: Color(0xFF8A8A8A),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password wajib diisi';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: !_passwordVisible2,
                  decoration: _inputDecoration(
                    'Konfirmasi Password*',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible2
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: const Color(0xFF8A8A8A),
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible2 = !_passwordVisible2;
                        });
                      },
                    ),
                  ),
                  style: const TextStyle(
                    color: Color(0xFF8A8A8A),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Konfirmasi password wajib diisi';
                    }
                    if (value != _passwordController.text) {
                      return 'Password tidak sama';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 94, 103, 171),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // TODO: Tambahkan logika registrasi yang sebenarnya
                        print('Username: ${_usernameController.text}');
                        print('Full Name: ${_fullNameController.text}');
                        print(
                            'Phone: $_selectedCountryCode${_phoneController.text}');
                        print('Email: ${_emailController.text}');
                        print('Password: ${_passwordController.text}');
                         ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Registrasi berhasil')),
                        );
                      }
                    },
                    child: const Text('Simpan'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}