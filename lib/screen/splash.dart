import 'dart:async';

import 'package:flutter/material.dart';

import 'welcome.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Welcome()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'Assets/images/logo.png',
                width: 200,
                height: 100,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'LEARNING MANAGEMENT SYSTEM',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 15,
                  fontFamily: 'OpenSans',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'FACULTY OF COMPUTING',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 15,
                  fontFamily: 'OpenSans',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'SABARAGAMUWA UNIVERSITY OF SRI LANKA',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 15,
                  fontFamily: 'OpenSans',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
