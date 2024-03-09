import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyD_f3srn8rPlM9v1bsVWlaoAUx2ZrYZV0Q",
          authDomain: "theproject1-e7869.firebaseapp.com",
          projectId: "theproject1-e7869",
          storageBucket: "theproject1-e7869.appspot.com",
          messagingSenderId: "819941299504",
          appId: "1:819941299504:web:7939a961960d1ba7d3a4f5",
          measurementId: "G-GKL14CYFLP"
      )
    );
  }
  runApp(MaterialApp(
    home: SplashScreenPage(),
  ));
}

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/splash screen.png'),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
          Positioned(
            bottom: 105,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Future.delayed(const Duration(milliseconds: 350), () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage(title: "Login Page")),
                    );
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color(0xFF472bad),
                  ),
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.orange; // Change to the color you want when pressed
                      }
                      return Color(0xFF472bad); // Use the existing color when not pressed
                    },
                  ),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
