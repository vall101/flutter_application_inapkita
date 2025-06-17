import 'package:flutter/material.dart';
import 'package:flutter_application_inapkita/screen/login/login_customer_form.dart';
import 'package:flutter_application_inapkita/screen/login/register_customer_screen.dart';

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
      home: const LoginCustomerScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginCustomerScreen extends StatelessWidget {
  const LoginCustomerScreen({Key? key}) : super(key: key);

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
              Image.asset(
                'assets/images/Logo_apk.png',
                width: 80,
                height: 80,
                fit: BoxFit.contain,
                semanticLabel:
                    'InapKita logo with a blue person shape and a white house inside',
              ),
              const SizedBox(height: 0),
              Text(
                'InapKita',
                style: TextStyle(
                  color: blueColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  shadows: const [
                    Shadow(
                      offset: Offset(0, 2),
                      blurRadius: 2,
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
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
                    'Log in',
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
                        builder: (context) => const RegisterPage(),
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
                    'Create Account',
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