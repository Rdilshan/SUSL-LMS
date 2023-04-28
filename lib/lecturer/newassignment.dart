import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/homepage/homepage.dart';

// ignore: camel_case_types
class newassignment extends StatefulWidget {
  const newassignment({super.key});

  @override
  State<newassignment> createState() => _newassignmentState();
}

// ignore: camel_case_types
class _newassignmentState extends State<newassignment> {
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
        ),
        bottomNavigationBar: Container(
            height: 60,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    enableFeedback: false,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.home_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                  IconButton(
                    enableFeedback: false,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.work_outline_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                  IconButton(
                    enableFeedback: false,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.widgets_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                  IconButton(
                    enableFeedback: false,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.person_outline,
                      color: Colors.white,
                      size: 35,
                    ),
                  )
                ] //yes

                ) //yes

            ), //yes

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
                        const SizedBox(
                          width: 300,
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'Create Assignment Title',
                              hintStyle:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.all(30),
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'Create Assignment Description',
                              hintStyle:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
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
                              height: 20,
                            ),
                            const Text(
                              'DEADLINE - DATE',
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
                              'DEADLINE - TIME',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 15,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 150,
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
                              'ATTACHMENTS',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 15,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                            const SizedBox(
                              height: 20,
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
                                                const Size(240, 60)),
                                      ),
                                      child: const Text(
                                        'UPLOAD ATTACHMENTS',
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
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
                            const SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                              onPressed: null,
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                                fixedSize: MaterialStateProperty.all<Size>(
                                    const Size(130, 40)),
                              ),
                              child: const Text(
                                'SAVE DRAFT',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            ElevatedButton(
                              onPressed: null,
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                                fixedSize: MaterialStateProperty.all<Size>(
                                    const Size(130, 40)),
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
                          ]),
                        ),

                        //container
                      ] //children

                      ) //COLUMN

                  ) //CONTAINER
            ] //CHILD
                ) //COLUMN

            ) //SINGLESCROLLVIEW
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

