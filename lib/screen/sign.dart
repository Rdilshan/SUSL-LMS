import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'homepage.dart';
import 'package:flutter_application_5/screen/homepage.dart';

class Sign extends StatefulWidget {
  const Sign({Key? key}) : super(key: key);

  @override
  State<Sign> createState() => _SignState();
}

class _SignState extends State<Sign> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  String errorMessage = '';

  void login() async {
    final response = await http.get(Uri.parse(
        'https://susllms2.000webhostapp.com/student/logincheck.php?indexnum=${nameController.text}&password=${passwordController.text}'));
    if (response.body == "1") {
      print("Login successful");
      // ignore: use_build_context_synchronously
      navigateToHomepage(context, const homepage());
    } else {
      print("Login failed");
      setState(() {
        errorMessage = "Incorrect username or password";
      });
    }
  }

  void loginAsGuest() {
    // Handle guest login here
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
                height: 10,
              ),
              if (errorMessage.isNotEmpty)
                Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'USERNAME',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'PASSWORD',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'FORGOT USERNAME OR PASSWORD?',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: login,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 81, 24, 24),
                  ),
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(200, 40)),
                ),
                child: const Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'SOME COURSES MAY ALLOW GUEST ACCESS',
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0), fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: loginAsGuest,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 81, 24, 24),
                  ),
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(200, 40)),
                ),
                child: const Text(
                  'LOGIN AS A GUEST',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 18,
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

navigateToHomepage(BuildContext context, Widget homepageWidget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => homepageWidget),
  );
}
