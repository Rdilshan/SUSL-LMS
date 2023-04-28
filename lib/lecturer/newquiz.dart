import 'package:flutter/material.dart';

import 'package:flutter_application_5/lecturer/newassignment.dart';

class newquiz extends StatefulWidget {
  const newquiz({super.key});

  @override
  State<newquiz> createState() => _newquizState();
}

class _newquizState extends State<newquiz> {
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
                'CREATE NEW QUIZ',
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
                  'MCQ',
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
                onPressed: null,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 81, 24, 24)),
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(150, 40)),
                ),
                child: const Text(
                  'FORUM',
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

void navigateTonewAssignment(BuildContext context, Widget newassignmentWidget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => newassignmentWidget),
  );
}
