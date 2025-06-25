import 'package:flutter/material.dart';
import 'package:flutter_application_inapkita/screen/login/login_customer_screen.dart';
import 'package:flutter_application_inapkita/screen/login/login_pegawai_form.dart';

void main() {
  runApp(const InapKitaApp());
}

class InapKitaApp extends StatelessWidget {
  const InapKitaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InapKita Login',
      theme: ThemeData(
        primaryColor: const Color(0xFF1858EE),
        fontFamily: 'Roboto',
      ),
      home: const LoginSelectionScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginSelectionScreen extends StatelessWidget {
  const LoginSelectionScreen({super.key});

  static const Color blueColor = Color.fromARGB(255, 94, 103, 171);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
               Image.network(
                'https://i.imgur.com/SbeKTyI.png',
                width: 200,
                height: 200,
                fit: BoxFit.contain,
                semanticLabel:
                'InapKita logo with a blue person shape and a white house inside',
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const CircularProgressIndicator();
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error, color: Colors.red);
                    },
                    ),
              const SizedBox(height: 0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPegawai(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: blueColor,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    elevation: 4,
                  ),
                  child: const Text(
                    'Login Pegawai',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginCustomerScreen(),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: const Text(
                    'Login Customer',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

