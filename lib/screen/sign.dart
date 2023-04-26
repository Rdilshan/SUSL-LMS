import 'package:flutter/material.dart';
import 'package:flutter_application_5/homepage/homepage.dart';

class Sign extends StatefulWidget {
  const Sign({super.key});

  @override
  State<Sign> createState() => _SignState();
}

class _SignState extends State<Sign> {
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
                height: 10,
              ),
              const SizedBox(
                width: 350,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'USERNAME',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                width: 350,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'PASSWORD',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const Text(
                'FORGOT USERNAME OR PASSWORD?',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 18,
                  fontFamily: 'OpenSans',
                ),
              ),
              ElevatedButton(
                onPressed: () => navigateToHomepage(context, const homepage()),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 81, 24, 24)),
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(250, 40)),
                ),
                child: const Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 18,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Text(
                'SOME COURSES MAY ALLOW GUEST ACCESS',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 18,
                  fontFamily: 'OpenSans',
                ),
              ),
              ElevatedButton(
                onPressed: null,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 81, 24, 24)),
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(250, 40)),
                ),
                child: const Text(
                  'LOGIN AS A GUEST',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 18,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
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

void navigateToHomepage(BuildContext context, Widget homepageWidget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => homepageWidget),
  );
}
