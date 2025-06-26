import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPropertyPage extends StatefulWidget {
  const AddPropertyPage({super.key}); // gunakan super.key

  @override
  AddPropertyPageState createState() => AddPropertyPageState(); // public state
}

class AddPropertyPageState extends State<AddPropertyPage> {
  final _formKey = GlobalKey<FormState>();
  String? propertyName;
  String? propertyAddress;
  String? propertyDescription;
  String? propertyPhone;
  String? propertyPrice;
  ImageProvider? propertyImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        propertyImage = FileImage(File(pickedFile.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3B5998),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'inap_logo_2',
              child: Image.asset('assets/images/inap_logo_2.png', height: 32),
            ),
            const SizedBox(width: 8),
            const Text(
              'InapKita',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
        elevation: 4,
        shadowColor: const Color(0xFF4B5E93).withAlpha((255 * 0.2).toInt()), // ganti withOpacity
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 20.0,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12),
                  Center(
                    child: Text(
                      'Add Property',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4B5E93),
                        letterSpacing: 1.2,
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
                  SizedBox(height: 28),
                  Text(
                    'Foto Properti',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.grey.shade100,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: propertyImage == null
                            ? Icon(
                                Icons.add_a_photo,
                                size: 44,
                                color: Colors.grey.shade500,
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image(
                                  image: propertyImage!,
                                  width: 110,
                                  height: 110,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                    ),
                  ),
                  SizedBox(height: 28),
                  _buildLabel('Nama Properti'),
                  _buildTextField(
                    hint: 'Tulis nama properti Anda',
                    onSaved: (val) => propertyName = val,
                    validator:
                        (val) =>
                            val == null || val.isEmpty
                                ? 'Silakan masukkan nama properti'
                                : null,
                  ),
                  SizedBox(height: 18),
                  _buildLabel('Alamat Properti'),
                  _buildTextField(
                    hint: 'Tulis alamat properti Anda',
                    onSaved: (val) => propertyAddress = val,
                    validator:
                        (val) =>
                            val == null || val.isEmpty
                                ? 'Silakan masukkan alamat properti'
                                : null,
                  ),
                  SizedBox(height: 18),
                  _buildLabel('Deskripsi Properti'),
                  _buildTextField(
                    hint: 'Masukkan deskripsi',
                    maxLines: 3,
                    onSaved: (val) => propertyDescription = val,
                    validator:
                        (val) =>
                            val == null || val.isEmpty
                                ? 'Silakan masukkan deskripsi'
                                : null,
                  ),
                  SizedBox(height: 18),
                  _buildLabel('Nomor Telepon Properti'),
                  _buildTextField(
                    hint: 'Masukkan nomor telepon',
                    keyboardType: TextInputType.phone,
                    onSaved: (val) => propertyPhone = val,
                    validator:
                        (val) =>
                            val == null || val.isEmpty
                                ? 'Silakan masukkan nomor telepon'
                                : null,
                  ),
                  SizedBox(height: 18),
                  _buildLabel('Harga'),
                  _buildTextField(
                    hint: 'Harga',
                    keyboardType: TextInputType.number,
                    onSaved: (val) => propertyPrice = val,
                    validator:
                        (val) =>
                            val == null || val.isEmpty
                                ? 'Silakan masukkan harga'
                                : null,
                  ),
                  SizedBox(height: 36),
                  Center(
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF4B5E93),
                          padding: EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 4,
                          shadowColor: Color(0xFF4B5E93).withAlpha((255 * 0.3).toInt()), // ganti withOpacity
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            FocusScope.of(context).unfocus();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Property submitted!')),
                            );
                          }
                        },
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 2.0, bottom: 4.0),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Color(0xFF333366),
        ),
      ),
    );
  }

  Widget _buildTextField({
    String? hint,
    int maxLines = 1,
    TextInputType? keyboardType,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
  }) {
    return TextFormField(
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFF4B5E93), width: 1.2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFFB0B6C3), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFF4B5E93), width: 2),
        ),
      ),
      onSaved: onSaved,
      validator: validator,
    );
  }
}
