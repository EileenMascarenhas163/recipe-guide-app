import 'package:demo/dashboard.dart';
import 'package:demo/main.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          '~WELCOME~',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 214, 14, 14),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            AlertDialog(
              title: const Text(
                'Welcome to Cook Away!',
                style: TextStyle(
                    fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
              ),
              content: const Text(
                  'You have the ingrediants but do not know what to make?\n\nCongratulations, you are at the right place.\n\nCookAway will accept your ingrediants and show you different options on what you can make, and do not worry we give you those recipes as well.\n\n\nBut first you need to Login for free.\n\n',
                  style: TextStyle(
                    fontFamily: 'Calibri',
                    fontSize: 18,
                  )),
              actions: [
                FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MainPage()),
                    );
                  },
                  tooltip: 'Google Login',
                  child: const Icon(Icons.login),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
