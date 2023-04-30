import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/homepage/homepage.dart';

// ignore: camel_case_types
class assignment extends StatefulWidget {
  const assignment({super.key});

  @override
  State<assignment> createState() => _assignmentState();
}

// ignore: camel_case_types
class _assignmentState extends State<assignment> {
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
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 81, 24, 24),
          elevation: 0,
        ),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
              Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 81, 24, 24),
                    // image: DecorationImage(
                    //   image: AssetImage('Assets/images/whitebg.png'),
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'ASSIGNMENT 01',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.all(30),
                          child: Text(
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(color: Colors.white),
                              'Write a report on the software design issues faced by a software company of your choice'),
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: null,
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                            fixedSize: MaterialStateProperty.all<Size>(
                                const Size(125, 35)),
                          ),
                          child: const Text(
                            'DOWNLOAD',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 15,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        //children

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
                              'SUBMISSION STATUS',
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
                                border:
                                    Border.all(color: Colors.black, width: 2),
                              ),
                              child: const Text("PENDING",
                                  style: TextStyle(fontSize: 18)),
                            ),
                            const Text(
                              'DEADLINE',
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
                                border:
                                    Border.all(color: Colors.black, width: 2),
                              ),
                              child: const Text("DD/MM/YYYY",
                                  style: TextStyle(fontSize: 18)),
                            ),
                            const Text(
                              'TIME REMAINING',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 15,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                            Container(
                              height: 60,
                              width: 180,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(20),
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2),
                              ),
                              child: const Text("00:00:00",
                                  style: TextStyle(fontSize: 32)),
                            ),
                            const SizedBox(
                              height: 5,
                              width: 400,
                            ),
                            const Text(
                              'UPLOAD ASSIGNMENT',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 15,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              child: isLoading
                                  ? const CircularProgressIndicator()
                                  : ElevatedButton(
                                      onPressed: () {
                                        pickFile();
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                const Color.fromARGB(
                                                    255, 196, 194, 194)),
                                        fixedSize:
                                            MaterialStateProperty.all<Size>(
                                                const Size(250, 70)),
                                      ),
                                      child: const Text(
                                        'UPLOAD FILES',
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontSize: 15,
                                          fontFamily: 'OpenSans',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      // if (pickedfile != null)
                                      //   const SizedBox(
                                      //       height: 300,
                                      //       width: 400,
                                      //       child: Image.file(fileToDisplay!)), //SizedBox

                                      //onTap: null,
                                    ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ElevatedButton(
                              onPressed: null,
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                                fixedSize: MaterialStateProperty.all<Size>(
                                    const Size(120, 40)),
                              ),
                              child: const Text(
                                'SUBMIT',
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

            ), //SI
        bottomNavigationBar: LMSBottomNavBar() // NGLESCROLLVIEW
        ); //yes
  }
}
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: isLoading
//                 ? CircularProgressIndicator()
//                 : ElevatedButton(
//                     onPressed: () {
//                       pickFile();
//                     },
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all<Color>(
//                           const Color.fromARGB(255, 196, 194, 194)),
//                       fixedSize:
//                           MaterialStateProperty.all<Size>(const Size(250, 80)),
//                     ),
//                     child: const Text(
//                       'UPLOAD',
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 255, 255, 255),
//                         fontSize: 15,
//                         fontFamily: 'OpenSans',
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//           ),
//           if (pickedfile != null)
//             SizedBox(
//                 height: 300, width: 400, child: Image.file(fileToDisplay!)),
//         ],
//       ),
//     );
//a
