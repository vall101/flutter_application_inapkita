import 'package:flutter/material.dart';
import 'package:flutter_application_inapkita/screen/beranda/beranda.dart';


void main() {
  runApp(const InapKitaLoginApp());
} 

class InapKitaLoginApp extends StatelessWidget {
  const InapKitaLoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InapKita Login',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 152, 85, 59),
        fontFamily: 'Inter',
      ),
      // home: const LoginCustomerForm(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginCustomerForm extends StatefulWidget {
  const LoginCustomerForm({super.key});

  @override
  State<LoginCustomerForm> createState() => _LoginCustomerFormState();
}

class _LoginCustomerFormState extends State<LoginCustomerForm> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
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

              // Email
              const Text(
                'Email',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
              const SizedBox(height: 6),
              TextField(
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
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
              ),
              const SizedBox(height: 20),

              // Password
              const Text(
                'Kata sandi',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
              const SizedBox(height: 6),
              TextField(
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
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                      color: Colors.grey[600],
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    tooltip: _obscurePassword ? 'Show password' : 'Hide password',
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // Lupa password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Forgot password action
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(50, 24),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    'Lupa kata sandi ?',
                    style: TextStyle(fontSize: 12, color: Colors.black87),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Tombol Login
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Beranda()),
                  );
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

              const SizedBox(height: 24),
              const Divider(color: Colors.grey, thickness: 1),
              const SizedBox(height: 16),

              const Text(
                'Login langsung menggunakan media sosial kamu',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 16),

              // Tombol Sosial Media
              SocialLoginButton(
                icon: Icons.apple,
                iconColor: Colors.black,
                text: 'Lanjut dengan Apple',
                onPressed: () {},
              ),
              const SizedBox(height: 12),
              SocialLoginButton(
                iconWidget: Image.network(
                  'https://banner2.cleanpng.com/20240216/aop/transparent-google-logo-flat-google-logo-with-blue-green-red-1710875778465.webp',
                  width: 16,
                  height: 16,
                  semanticLabel: 'Google logo, multicolor G letter',
                ),
                text: 'Lanjut dengan Google',
                onPressed: () {},
              ),
              const SizedBox(height: 12),
              SocialLoginButton(
                icon: Icons.facebook,
                iconColor: const Color(0xFF1877F2),
                text: 'Lanjut dengan Facebook',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialLoginButton extends StatelessWidget {
  final IconData? icon;
  final Widget? iconWidget;
  final Color? iconColor;
  final String text;
  final VoidCallback onPressed;

  const SocialLoginButton({
  super.key,
  this.icon,
  this.iconWidget,
  this.iconColor,
  required this.text,
  required this.onPressed,
}) : assert(icon != null || iconWidget != null, 'Either icon or iconWidget must be provided');


  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.grey),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 12),
        foregroundColor: Colors.black87,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Icon(
              icon,
              color: iconColor ?? Colors.black,
              size: 20,
            ),
          if (iconWidget != null) iconWidget!,
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
