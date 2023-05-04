import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../Src/widgets/bottomNavBar.dart';
import 'package:flutter_application_5/Src/widgets/sideNav.dart';

// ignore: camel_case_types
class myaccount extends StatefulWidget {
  const myaccount({super.key});

  @override
  State<myaccount> createState() => _myaccountState();
}

// ignore: camel_case_types
class _myaccountState extends State<myaccount> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  FilePickerResult? result;
  String? _fileName;
  PlatformFile? pickedfile;
  bool isLoading = false;
  File? fileToDisplay;

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
        pickedfile = result!.files.first;
        fileToDisplay = File(pickedfile!.path.toString());

        print('File Name : $_fileName');
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 81, 24, 24),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu_rounded),
          iconSize: 40,
          color: Colors.white,
          onPressed: () {
            if (scaffoldKey.currentState!.isDrawerOpen) {
              scaffoldKey.currentState!.closeDrawer();
              //close drawer, if drawer is open
            } else {
              scaffoldKey.currentState!.openDrawer();
              //open drawer, if drawer is closed
            }
          },
        ),
      ),
      //yes

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
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage('photo.jpeg'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Student Name',
                        style: TextStyle(color: Colors.white, fontSize: 23),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'studentemail@std.sab.ac.appsc.lk',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),

                      const SizedBox(
                        height: 40,
                      ),

                      Container(
                        decoration: const BoxDecoration(
                          //color: Color.fromARGB(255, 81, 24, 24),
                          image: DecorationImage(
                            image: AssetImage('Assets/images/whitebg.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Column(children: [
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
                          const Text(
                            '19/20',
                            style: TextStyle(
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
                          const Text(
                            'BSc. (Hons) in Software Engineering',
                            style: TextStyle(
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
                            child: const Text("DD/MM/YYYY",
                                style: TextStyle(fontSize: 18)),
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
                              backgroundColor: MaterialStateProperty.all<Color>(
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
                        ]),
                      ),

                      //container
                    ] //children

                    ) //COLUMN

                ) //CONTAINER
          ] //CHILD
              ) //COLUMN

          ), //SINGLESCROLLVIEW
      bottomNavigationBar: LMSBottomNavBar(), // NGLESCROLLVIEW
      drawer: sideNav(), //yes
    ); //yes
  }
}
  
//   