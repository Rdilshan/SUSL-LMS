import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../shared_data.dart';
import 'homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';


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
    if (response.body != "0") {
      print("Login successful");
      SharedData.loginResponse = response.body;
      // Save loginResponse using SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('loginResponse', response.body);

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
void initState() {
  super.initState();
  print(SharedData.loginResponse);
  _checkLoginResponse();
}

void _checkLoginResponse() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? loginResponse = prefs.getString('loginResponse');
  
  if (loginResponse != null && loginResponse.isNotEmpty) {
    SharedData.loginResponse = loginResponse;
    print("Go to homepage");
    navigateToHomepage(context, const homepage());
  }
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
                  fixedSize: MaterialStateProperty.all<Size>(const Size(200, 40)),
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
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 15
                ),
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
                  fixedSize: MaterialStateProperty.all<Size>(const Size(200, 40)),
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


void navigateToHomepage(BuildContext context, Widget homepageWidget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => homepageWidget),
  );
}

