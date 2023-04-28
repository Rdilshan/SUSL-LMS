import 'package:flutter/material.dart';
import '../homepage/homepage.dart';
import 'package:http/http.dart';


class Sign extends StatefulWidget {
  const Sign({Key? key});

  @override
  State<Sign> createState() => _SignState();
}

class _SignState extends State<Sign> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    Response response = await get(Uri.parse(
        'https://susllms2.000webhostapp.com/student/logincheck.php?indexnum=${nameController.text}&password=${passwordController.text}'));
    if (response.body == "1") {
      // ignore: avoid_print
      print("Login successful");
      // ignore: use_build_context_synchronously
      navigateToHomepage(context, const homepage());
    } else {
      // ignore: avoid_print
      print("Login failed");
    }
  }

  void loginAsGuest() {
    // handle guest login here
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

              const SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(

              SizedBox(
                width: 300,
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(

                    hintText: 'USERNAME',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              const SizedBox(
                width: 300,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(

              SizedBox(
                width: 300,
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(

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
                  fontFamily: 'OpenSans',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(

                onPressed: () => navigateToHomepage(context, const homepage()),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 81, 24, 24)),

                onPressed: login,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(

                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(200, 40)),
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
              const SizedBox(
                height: 10,
              ),
              const Text(
                'SOME COURSES MAY ALLOW GUEST ACCESS',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 15,
                  fontFamily: 'OpenSans',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: null,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(

                      Color.fromARGB(255, 81, 24, 24)),

                      const Color.fromARGB(255, 81, 24, 24)),

                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(200, 40)),
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
