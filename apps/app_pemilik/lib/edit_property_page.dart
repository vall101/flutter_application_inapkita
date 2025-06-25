import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditPropertyPage extends StatefulWidget {
  final Map<String, dynamic> property;
  const EditPropertyPage({super.key, required this.property}); // gunakan super.key

  @override
  EditPropertyPageState createState() => EditPropertyPageState(); // public state
}

class EditPropertyPageState extends State<EditPropertyPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _addressController;
  late TextEditingController _descController;
  late TextEditingController _phoneController;
  late TextEditingController _priceController;
  ImageProvider? propertyImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.property['name'] ?? '');
    _addressController = TextEditingController(text: widget.property['address'] ?? '');
    _descController = TextEditingController(text: widget.property['desc'] ?? '');
    _phoneController = TextEditingController(text: widget.property['phone'] ?? '');
    _priceController = TextEditingController(text: widget.property['price'] ?? '');
    if (widget.property['image'] != null) {
      propertyImage = AssetImage(widget.property['image']);
    }
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        propertyImage = FileImage(File(pickedFile.path));
      });
    }
  }

  void _deleteProperty() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Konfirmasi Hapus'),
        content: Text('Apakah Anda yakin ingin menghapus property ini?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Hapus', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
    if (confirm == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Property berhasil dihapus!')),
      );
      Navigator.pop(context, 'deleted');
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _descController.dispose();
    _phoneController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 2.0, bottom: 4.0),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Color(0xFF3B5998),
        ),
      ),
    );
  }

  Widget _buildTextField({
    String? hint,
    int maxLines = 1,
    TextInputType? keyboardType,
    TextEditingController? controller,
    FormFieldValidator<String>? validator,
  }) {
    return TextFormField(
      controller: controller,
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
      validator: validator,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/inap_logo_2.png', height: 32),
            SizedBox(width: 8),
            Text('InapKita'),
          ],
        ),
        elevation: 4,
        shadowColor: Theme.of(context).colorScheme.secondary.withAlpha((255 * 0.2).toInt()), // ganti withOpacity
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12),
                  Center(
                    child: Text(
                      'Edit Property',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
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
                  Text('Foto Properti', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
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
                            ? Icon(Icons.add_a_photo, size: 44, color: Colors.grey.shade500)
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
                    controller: _nameController,
                    validator: (val) => val == null || val.isEmpty ? 'Silakan masukkan nama properti' : null,
                  ),
                  SizedBox(height: 18),
                  _buildLabel('Alamat Properti'),
                  _buildTextField(
                    hint: 'Tulis alamat properti Anda',
                    controller: _addressController,
                  ),
                  SizedBox(height: 18),
                  _buildLabel('Deskripsi Properti'),
                  _buildTextField(
                    hint: 'Masukkan deskripsi',
                    maxLines: 3,
                    controller: _descController,
                  ),
                  SizedBox(height: 18),
                  _buildLabel('Nomor Telepon Properti'),
                  _buildTextField(
                    hint: 'Masukkan nomor telepon',
                    keyboardType: TextInputType.phone,
                    controller: _phoneController,
                  ),
                  SizedBox(height: 18),
                  _buildLabel('Harga'),
                  _buildTextField(
                    hint: 'Harga',
                    keyboardType: TextInputType.number,
                    controller: _priceController,
                  ),
                  SizedBox(height: 36),
                  Center(
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, // warna text putih
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            FocusScope.of(context).unfocus();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Data property berhasil diupdate!')),
                            );
                            Navigator.pop(context);
                          }
                        },
                        child: Text('Simpan'),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Center(
                    child: SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.red,
                          side: BorderSide(color: Colors.red),
                        ),
                        onPressed: _deleteProperty,
                        child: Text('Hapus Property'),
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
}
