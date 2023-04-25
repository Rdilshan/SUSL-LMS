import 'package:flutter/material.dart';

import 'sign.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {



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


              const Text(
                'LOGIN AS',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 18,
                  fontFamily: 'OpenSans',
                ),
              ),
              
              const SizedBox(
                height: 5,
              ),


              ElevatedButton(
                onPressed: () => navigateToSignup(context, const Sign()),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(250, 40)),
                ),

                child: const Text(
                  'I AM A STUDENT',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 18,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),


              const SizedBox(
                height: 5,
              ),


              ElevatedButton(
                onPressed: () => navigateToSignup(context, const Sign()),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(250, 40)),
                ),
                child: const Text(
                  'I AM A LECTURER',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 18,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}




void navigateToSignup(BuildContext context, Widget signupWidget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => signupWidget),
  );
}
