import 'package:flutter/material.dart';
import 'package:flutter_application_5/submit_assignment/assignment.dart';

// ignore: camel_case_types
class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

// ignore: camel_case_types
class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                'UPCOMING ACTIVITIES',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 18,
                  fontFamily: 'OpenSans',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'RECENTLY ACCESSED COURSES',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 18,
                  fontFamily: 'OpenSans',
                ),
              ),
              ElevatedButton(
                onPressed: () =>
                    navigateToAssignment(context, const assignment()),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 81, 24, 24)),
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(250, 40)),
                ),
                child: const Text(
                  'ASSIGNMENT',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 18,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                  ),
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
                  'MY COURSES',
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

void navigateToAssignment(BuildContext context, Widget assignmentWidget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => assignmentWidget),
  );
}
