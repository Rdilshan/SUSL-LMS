import 'dart:io';
//import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/Src/widgets/sideNav.dart';

import '../Src/widgets/bottomNavBar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';


class Assignmentcard {
  final String assignmentID;
  final String subject;
  final String title;
  final String description;
  final String deadline;
  final String attachment;

  const Assignmentcard({
    required this.assignmentID,
    required this.subject,
    required this.title,
    required this.description,
    required this.deadline,
    required this.attachment,
  });
}

// ignore: camel_case_types
class assignment extends StatefulWidget {
  final String itemId;

  assignment({required this.itemId});

  @override
  State<assignment> createState() => _assignmentState();
}




class _assignmentState extends State<assignment> {

  List<Assignmentcard> assignmentCards = [];
  List<String> assignmentDeadlines = [];
  
  @override
  void initState() {
    super.initState();
    fetchAssignmentCards(widget.itemId);
  }

  Future<void> fetchAssignmentCards(String itemId) async {
    final url = 'https://susllms2.000webhostapp.com/student/getoneassignment.php?id=$itemId';
    print(url);

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);

      setState(() {
        assignmentCards.clear();

        for (var assignmentData in responseData) {
          Assignmentcard assignmentCard = Assignmentcard(
            assignmentID: assignmentData['assignmentID'],
            subject: assignmentData['subject'],
            title: assignmentData['title'],
            description: assignmentData['description'],
            deadline: assignmentData['deadline'],
            attachment: assignmentData['attachment'],
          );

          assignmentCards.add(assignmentCard);
        }
      });
    } else {
      throw Exception('Failed to fetch assignment cards');
    }
  }

String formatTime(assignmentDeadlines) {
 return assignmentDeadlines;
}



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
        extendBody: true,
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
                        Text(
                          widget.itemId,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                       Padding(
                          padding: EdgeInsets.all(30),
                          child: ListView.builder(
                            shrinkWrap: true, // Set shrinkWrap to true
                            itemCount: assignmentCards.length,
                            itemBuilder: (context, index) {
                              return Text(
                                assignmentCards[index].description,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.white),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 1,
                        ),

                        ElevatedButton(
                          onPressed: () async {
                            if (assignmentCards.isNotEmpty) {
                              String documentUrl = 'https://susllms2.000webhostapp.com/Assignment/lecture/${assignmentCards[0].attachment}';
                              if (await canLaunch(documentUrl)) {
                                await launch(documentUrl);
                              } else {
                                throw 'Could not launch $documentUrl';
                              }
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                            fixedSize: MaterialStateProperty.all<Size>(const Size(125, 35)),
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
                                color: Colors.grey,
                                border:
                                    Border.all(color: Colors.grey, width: 2),
                              ),
                              child: const Text(
                                "PENDING",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
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
                                border: Border.all(color: Colors.grey, width: 2),
                              ),
                              child: ListView.builder(
                                itemCount: assignmentCards.length,
                                itemBuilder: (context, index) {
                                  assignmentDeadlines.add(assignmentCards[index].deadline); 
                                  return Text(
                                      assignmentCards[index].deadline,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(255, 0, 0, 0),
                                        
                                      ),
                                    );
                                },
                              ),
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
                                    Border.all(color: Colors.grey, width: 2),
                              ),
                              child: Text(
                                  formatTime(assignmentDeadlines.isNotEmpty ? assignmentDeadlines[0] : ''),
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
                              height: 25,
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
                              height: 150,
                            ),
                          ]),
                        ),

                        //container
                      ] //children

                      ) //COLUMN

                  ) //CONTAINER
            ] //CHILD
                )
            //COLUMN

            ),

        //SI
        bottomNavigationBar: LMSBottomNavBar(), // NGLESCROLLVIEW
        drawer: sideNav()); //yes
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
