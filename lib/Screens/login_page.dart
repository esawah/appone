import 'package:appone/Screens/dashboard_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool hidenpass = true;

  void _showpass() {
    setState(() {
      hidenpass = !hidenpass;
    });
  }

  void _login() {
    final username = _usernameController.text;
    final password = _passwordController.text;
    if (username == 'gina' && password == '032801') {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DashboardPage(username: username)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Username atau password salah'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.pink.shade50, // Latar belakang dengan warna pink muda
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1), // Padding responsif
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.15), // Jarak atas responsif
                Text(
                  "LOGIN",
                  style: TextStyle(
                    fontSize: screenWidth * 0.1, // Ukuran font responsif
                    fontFamily: "Poppins-SemiBold",
                    color: Colors.pink.shade700, // Warna teks pink
                  ),
                ),
                SizedBox(height: 30),
                Image.asset(
                  'assets/images/ilogin.png',
                  height: screenWidth * 0.35, // Ukuran gambar responsif
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 50),
                // TextField untuk Username
                TextField(
                  controller: _usernameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(color: Colors.pink.shade600),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    prefixIcon: Icon(Icons.person, color: Colors.pink.shade600),
                  ),
                ),
                SizedBox(height: 20),
                // TextField untuk Password
                TextField(
                  controller: _passwordController,
                  obscureText: hidenpass,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.pink.shade600),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    prefixIcon: Icon(Icons.lock, color: Colors.pink.shade600),
                    suffixIcon: IconButton(
                      onPressed: _showpass,
                      icon: Icon(
                        hidenpass ? Icons.visibility_off : Icons.visibility,
                        color: Colors.pink.shade600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                // Tombol Login
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade700,
                    foregroundColor: Colors.white,
                    fixedSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Membuat tombol melengkung
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.1), // Jarak bawah responsif
              ],
            ),
          ),
        ),
      ),
    );
  }
}
