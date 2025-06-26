import 'package:flutter/material.dart';

class EditResepsionisPage extends StatefulWidget {
  final String namaAwal;
  final String teleponAwal;
  final String emailAwal;
  final String shiftAwal;

  const EditResepsionisPage({
    Key? key,
    required this.namaAwal,
    required this.teleponAwal,
    required this.emailAwal,
    required this.shiftAwal,
  }) : super(key: key);

  @override
  State<EditResepsionisPage> createState() => _EditResepsionisPageState();
}

class _EditResepsionisPageState extends State<EditResepsionisPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  String? _shift;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.namaAwal);
    _phoneController = TextEditingController(text: widget.teleponAwal);
    _emailController = TextEditingController(text: widget.emailAwal);
    _shift = widget.shiftAwal;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3B5998),
        title: const Text(
          'Edit Data Resepsionis',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 4,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Container(
              width: 400,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 8),
                    Center(
                      child: Text(
                        'Edit Data Resepsionis',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3B5998),
                          shadows: [
                            Shadow(
                              blurRadius: 6.0,
                              color: Colors.black26,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.only(left: 4, bottom: 4),
                      child: Text(
                        'Nama Lengkap',
                        style: TextStyle(
                          color: Color(0xFF3B5998),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    _buildTextField(
                      controller: _nameController,
                      hint: 'Masukkan nama lengkap',
                      validator: (val) => val == null || val.isEmpty ? 'Masukkan nama' : null,
                    ),
                    const SizedBox(height: 18),
                    Padding(
                      padding: const EdgeInsets.only(left: 4, bottom: 4),
                      child: Text(
                        'Nomor Telepon',
                        style: TextStyle(
                          color: Color(0xFF3B5998),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    _buildTextField(
                      controller: _phoneController,
                      hint: 'Masukkan nomor telepon',
                      keyboardType: TextInputType.phone,
                      validator: (val) => val == null || val.isEmpty ? 'Masukkan nomor telepon' : null,
                    ),
                    const SizedBox(height: 18),
                    Padding(
                      padding: const EdgeInsets.only(left: 4, bottom: 4),
                      child: Text(
                        'Shift',
                        style: TextStyle(
                          color: Color(0xFF3B5998),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: RadioListTile<String>(
                              title: const Text('Siang', style: TextStyle(fontWeight: FontWeight.bold)),
                              value: 'Siang',
                              groupValue: _shift,
                              activeColor: Color(0xFF3B5998),
                              onChanged: (val) => setState(() => _shift = val),
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                          Expanded(
                            child: RadioListTile<String>(
                              title: const Text('Malam', style: TextStyle(fontWeight: FontWeight.bold)),
                              value: 'Malam',
                              groupValue: _shift,
                              activeColor: Color(0xFF3B5998),
                              onChanged: (val) => setState(() => _shift = val),
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 4, bottom: 4),
                      child: Text(
                        'Email',
                        style: TextStyle(
                          color: Color(0xFF3B5998),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    _buildTextField(
                      controller: _emailController,
                      hint: 'Masukkan email',
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) => val == null || val.isEmpty ? 'Masukkan email' : null,
                    ),
                    const SizedBox(height: 28),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF4B5E93),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 4,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate() && _shift != null) {
                            FocusScope.of(context).unfocus();
                            Navigator.pop(context, {
                              'nama': _nameController.text,
                              'telepon': _phoneController.text,
                              'email': _emailController.text,
                              'shift': _shift,
                            });
                          } else if (_shift == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Pilih shift terlebih dahulu!')),
                            );
                          }
                        },
                        child: const Text('Simpan Perubahan'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    String? hint,
    bool obscureText = false,
    Widget? suffixIcon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey.shade400,
        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        suffixIcon: suffixIcon,
        hintStyle: const TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}
