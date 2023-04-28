import 'package:flutter/material.dart';

import 'package:flutter_application_5/lecturer/newassignment.dart';
import 'package:flutter_application_5/lecturer/newquiz.dart';

class createnew extends StatefulWidget {
  const createnew({super.key});

  @override
  State<createnew> createState() => _createnewState();
}

class _createnewState extends State<createnew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'CREATE NEW',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 18,
                  fontFamily: 'OpenSans',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () =>
                    navigateTonewAssignment(context, const newassignment()),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 81, 24, 24)),
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(150, 40)),
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
              const SizedBox(
                height: 5,
              ),
              ElevatedButton(
                onPressed: () => navigateTonewquiz(context, const newquiz()),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 81, 24, 24)),
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(150, 40)),
                ),
                child: const Text(
                  'QUIZ',
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
                      MaterialStateProperty.all<Size>(const Size(150, 40)),
                ),
                child: const Text(
                  'TUTORIAL',
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

void navigateTonewAssignment(BuildContext context, Widget newassignmentWidget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => newassignmentWidget),
  );
}

void navigateTonewquiz(BuildContext context, Widget newquizWidget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => newquizWidget),
  );
}
