import 'package:flutter/material.dart';
import 'package:theproject1/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'loginpage.dart';
import 'home_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  //final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _printLatestEmailValue() {
    final text = _emailController.text;
    print('Email Field: $text');
  }

  void _printLatestPasswordValue() {
    final text = _passwordController.text;
    print('Password Field: $text');
  }

  @override
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
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){},
              child: Text('Login'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LoginPage(title: "Login Page")),
          );
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }

  // void _signUp(BuildContext context) async {
  //   String email = _emailController.text;
  //   String password = _passwordController.text;
  //
  //   try {
  //     UserCredential userCredential = await FirebaseAuth.instance
  //         .createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => HomePage()),
  //     );
  //
  //     print("User is successfully created");
  //   } catch (e) {
  //     print("Error occurred during sign up: $e");
  //   }
  // }
}
