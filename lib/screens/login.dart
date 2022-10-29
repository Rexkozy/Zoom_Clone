import 'package:flutter/material.dart';
import 'package:zoom_clone_app/constants.dart';
import 'package:zoom_clone_app/screens/home.dart';
import 'package:zoom_clone_app/services/auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = "/login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            "Start or join a meeting",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 38.0),
            child: Image.asset(
              'assets/images/onboarding.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: ElevatedButton(
              child: const Text(
                "Google Sign In",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () async {
                bool res = await auth.signInWithGoogle(context);
                if (res) {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                }
              },
              style: ElevatedButton.styleFrom(
                  primary: buttonColor,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  side: const BorderSide(color: buttonColor)),
            ),
          )
        ]),
      ),
    );
  }
}