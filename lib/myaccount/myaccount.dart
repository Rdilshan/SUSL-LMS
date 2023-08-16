import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Src/widgets/bottomNavBar.dart';
import 'package:flutter_application_5/Src/widgets/sideNav.dart';

import '../shared_data.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  FilePickerResult? result;
  String? _fileName;
  PlatformFile? pickedFile;
  bool isLoading = false;
  File? fileToDisplay;
  Map<String, dynamic>? studentDetails;

  Future<void> fetchStudentDetails() async {
    final url = 'https://susllms2.000webhostapp.com/student/getstudentDetails.php?id=${SharedData.loginResponse}';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          studentDetails = data.isNotEmpty ? data[0] : null;
        });
      } else {
        print('Failed to fetch student details. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error while fetching student details: $e');
    }
  }

  void pickFile() async {
    try {
      setState(() {
        isLoading = true;
      });
      result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );

      if (result != null) {
        _fileName = result!.files.first.name;
        pickedFile = result!.files.first;
        fileToDisplay = File(pickedFile!.path.toString());

        print('File Name: $_fileName');
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchStudentDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 81, 24, 24),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu_rounded),
          iconSize: 40,
          color: Colors.white,
          onPressed: () {
            if (scaffoldKey.currentState!.isDrawerOpen) {
              scaffoldKey.currentState!.closeDrawer();
            } else {
              scaffoldKey.currentState!.openDrawer();
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 81, 24, 24),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const SizedBox(
                    height: 40,
                  ),
                  if (studentDetails != null)
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(
                      'https://susllms2.000webhostapp.com/images/student/' +
                          (studentDetails?['picture'] ?? ''),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    studentDetails?['name'] ?? '',
                    style: TextStyle(color: Colors.white, fontSize: 23),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    studentDetails?['email'] ?? '',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('Assets/images/whitebg.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'ACADEMIC YEAR',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 15,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            studentDetails?['batch'] ?? '',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 15,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'DEGREE PROGRAMME',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 15,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            studentDetails?['degree'] ?? '',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 15,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'DATE OF ENROLLMENT',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 15,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 150,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(20),
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                            ),
                            child:Text(
                              studentDetails?['enrollment_date'] ?? '',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                            width: 400,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: null,
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(
                                      Colors.black),
                              fixedSize: MaterialStateProperty.all<Size>(
                                  const Size(150, 40)),
                            ),
                            child: const Text(
                              'EDIT PROFILE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: LMSBottomNavBar(),
      drawer: sideNav(),
    );
  }
}
