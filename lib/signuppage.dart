import 'package:flutter/material.dart';
import 'home_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isTextFieldFocused = false;

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
                  image: const AssetImage('assets/signuploading.gif'),
                  width: isTextFieldFocused ? 100 : 300,
                  height: isTextFieldFocused ? 100 : 300,
                ),
              ),
            ),
          ),
          Positioned(
            top: isTextFieldFocused ? MediaQuery.of(context).size.height * 0.123 : MediaQuery.of(context).size.height * 0.47,
            left: isTextFieldFocused ? 0 : (MediaQuery.of(context).size.width - 300) / 2,
            right: isTextFieldFocused ? 0 : (MediaQuery.of(context).size.width - 300) / 2,
            child: Center(
              child: Transform.translate(
                offset: Offset(isTextFieldFocused ? ((MediaQuery.of(context).size.width - 300) / 2) : 0, 0),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: isTextFieldFocused ? 45 : 55, // Adjusted font size based on focus
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFFFB12B),
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
                    'Login',
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
