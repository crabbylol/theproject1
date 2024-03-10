import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_page.dart';
import 'toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'loginpage.dart';
import 'package:theproject1/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPageWithEmail extends StatefulWidget {
  const LoginPageWithEmail({super.key});

  @override
  State<LoginPageWithEmail> createState() => _LoginPageWithEmailState();
}

class _LoginPageWithEmailState extends State<LoginPageWithEmail> {
  // bool _isSigning = false;
  // final FirebaseAuthService _auth = FirebaseAuthService();
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isTextFieldFocused = false;

  void _printLatestEmailValue() {
    final text = _emailController.text;
    print('Email Field: $text');
  }

  void _printLatestPasswordValue() {
    final text = _passwordController.text;
    print('Password Field: $text');
  }

  void initState() {
    super.initState();

    _emailController.addListener(_printLatestEmailValue);
    _passwordController.addListener(_printLatestPasswordValue);
  }


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: const Color(0xFFFFFCF2),
          ),
          Positioned(
            top: isTextFieldFocused ? MediaQuery.of(context).size.height * 0.1 : MediaQuery.of(context).size.height * 0.10,
            left: isTextFieldFocused ? 0 : (MediaQuery.of(context).size.width - 300) / 2,
            child: Center(
              child: Transform.translate(
                offset: Offset(isTextFieldFocused ? ((MediaQuery.of(context).size.width - 300) / 2) : 0, 0),
                child: Image(
                  image: const AssetImage('assets/loading.gif'),
                  width: isTextFieldFocused ? 110 : 310,
                  height: isTextFieldFocused ? 110 : 310,
                ),
              ),
            ),
          ),
          Positioned(
            top: isTextFieldFocused ? MediaQuery.of(context).size.height * 0.153 : MediaQuery.of(context).size.height * 0.48,
            left: isTextFieldFocused ? 0 : (MediaQuery.of(context).size.width - 300) / 2,
            right: isTextFieldFocused ? 0 : (MediaQuery.of(context).size.width - 300) / 2,
            child: Center(
              child: Transform.translate(
                offset: Offset(isTextFieldFocused ? ((MediaQuery .of(context).size.width - 300) / 2) : 0, 0),
                child: Text(
                  'Login with Email',
                  style: TextStyle(
                    fontSize: isTextFieldFocused ? 25 : 40,
                    // Adjusted font size based on focus
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFB12B),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 125,
            left: 40,
            right: 40,
            child: Column(
              children: [
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Email',
                  ),
                  onTap: () {
                    setState(() {
                      isTextFieldFocused = true;
                    });
                  },
                  onChanged: (value) {
                    setState(() {});
                  },
                  onSubmitted: (value) {
                    setState(() {
                      isTextFieldFocused = false;
                    });
                  },
                ),
                const SizedBox(height: 20),
                TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Password',
                  ),
                  onTap: () {
                    setState(() {
                      isTextFieldFocused = true;
                    });
                  },
                  onChanged: (value) {
                    setState(() {});
                  },
                  onSubmitted: (value) {
                    setState(() {
                      isTextFieldFocused = false;
                    });
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(title: "Home Page")),
                      );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF482BAD),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Color(0xFFFFFCF2)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
