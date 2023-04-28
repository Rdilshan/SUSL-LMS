import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

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
        body: Container(
            // ignore: prefer_const_constructors
            //color: Color.fromARGB(255, 73, 31, 31),

            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,

              children: [
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'Assets/images/menuicon.png',
                  width: 40,
                  height: 35,
                  alignment: Alignment.topLeft,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'ASSIGNMENT',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Write a report on the software design issues faced by a software company of your choice',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 15,
                    fontFamily: 'OpenSans',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: null,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    fixedSize:
                        MaterialStateProperty.all<Size>(const Size(125, 35)),
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
                  height: 40,
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
                  width: 200,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: const Text("PENDING", style: TextStyle(fontSize: 18)),
                ),
                const SizedBox(
                  height: 10,
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
                  height: 50,
                  width: 200,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child:
                      const Text("DD/MM/YYYY", style: TextStyle(fontSize: 18)),
                ),
                const SizedBox(
                  height: 10,
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
                  width: 200,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: const Text("00:00:00", style: TextStyle(fontSize: 32)),
                ),
                const SizedBox(
                  height: 10,
                ),

                const Text(
                  'UPLOAD FILES',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 15,
                    fontFamily: 'OpenSans',
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),

                const SizedBox(
                  height: 10,
                ),
                // GestureDetector(
                //   child: Container(
                //     width: 120,
                //     height: 40,
                //     decoration: const BoxDecoration(
                //       //color: Colors.black,
                //       image: DecorationImage(
                //           image: AssetImage('Assets/images/upload.png'),
                //           fit: BoxFit.cover),
                //     ),
                //   ),
                //   //onTap: null,
                // ),
                GestureDetector(
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            pickFile();
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 196, 194, 194)),
                            fixedSize: MaterialStateProperty.all<Size>(
                                const Size(250, 80)),
                          ),
                          child: const Text(
                            'UPLOAD',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 15,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                  // if (pickedfile != null)
                  //   const SizedBox(
                  //       height: 300,
                  //       width: 400,
                  //       child: Image.file(fileToDisplay!)), //SizedBox

                  //onTap: null,
                ),

                ElevatedButton(
                  onPressed: null,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    fixedSize:
                        MaterialStateProperty.all<Size>(const Size(120, 40)),
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
              ],
            )));
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

//     throw UnimplementedError();
//   }
// }