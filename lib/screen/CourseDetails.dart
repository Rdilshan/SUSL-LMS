import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/Src/widgets/sideNav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_5/submit_assignment/assignment.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Src/theme/palette.dart';
import '../Src/widgets/bottomNavBar.dart';
import 'package:http/http.dart' as http;
import 'dart:core';

class CardItem {
  final String CourseCode;
  final String Title;
  final String Status;
  final String path;

  const CardItem({
    required this.CourseCode,
    required this.Title,
    required this.Status,
    required this.path,
  });
}

class CourseDetails extends StatefulWidget {
  final String subjectCode;
  final String subjectTitle;

  CourseDetails({required this.subjectCode, required this.subjectTitle});

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  FilePickerResult? result;
  String? _fileName;
  PlatformFile? pickedfile;
  bool isLoading = false;
  File? fileToDisplay;

  List<CardItem> Lecture_side = [];
  List<CardItem> assignment_side = [];
  List<CardItem> Quizzes_side = [];
  List<CardItem> Recordings_side = [];


  @override
  void initState() {
    super.initState();
    fetchAssignmentCards(widget.subjectCode);
    fetchassignmentforeachsubject(widget.subjectCode);
    fetchquizzcards(widget.subjectCode);
    fetchRecordingCards(widget.subjectCode);

    
  }

  Future<void> fetchAssignmentCards(String subjectCode) async {
    final url =
        'https://susllms2.000webhostapp.com/student/geteachsubjectlecures.php?subjectcode=$subjectCode';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // Check if the response was successful
        final jsonResponse = response.body; // Get the response body
        final List<dynamic> jsonList = json.decode(jsonResponse);

        // Process the JSON response and create CardItem instances
        List<CardItem> cardItems = [];
        for (var jsonItem in jsonList) {
          CardItem cardItem = CardItem(
            CourseCode: jsonItem['lecture_code'],
            Title: jsonItem['title'],
            Status: '', // You need to determine how to get the status value
            path: jsonItem['path'],
          );
          cardItems.add(cardItem);
        }
        setState(() {
          Lecture_side = cardItems; // Save fetched data into Lecture_side list
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
      // Handle error gracefully
    }
  }

  Future<void> fetchassignmentforeachsubject(String subjectCode) async {
    final url =
        'https://susllms2.000webhostapp.com/student/geteachassignmentofsubject.php?subjectcode=$subjectCode';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // Check if the response was successful
        final jsonResponse = response.body; // Get the response body
        final List<dynamic> jsonList = json.decode(jsonResponse);

        // Process the JSON response and create CardItem instances
        List<CardItem> cardItems = [];
        for (var jsonItem in jsonList) {
          CardItem cardItem = CardItem(
            CourseCode: jsonItem['subject'],
            Title: jsonItem['type'],
            Status: '', // You need to determine how to get the status value
            path: jsonItem['id'],
          );
          cardItems.add(cardItem);
        }
        setState(() {
          assignment_side =
              cardItems; // Save fetched data into Lecture_side list
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
      // Handle error gracefully
    }
  }

  Future<void> fetchquizzcards(String subjectCode) async {
    final url =
        'https://susllms2.000webhostapp.com/student/getquizzeechofsubject.php?subjectcode=$subjectCode';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // Check if the response was successful
        final jsonResponse = response.body; // Get the response body
        final List<dynamic> jsonList = json.decode(jsonResponse);

        // Process the JSON response and create CardItem instances
        List<CardItem> cardItems = [];
        for (var jsonItem in jsonList) {
          CardItem cardItem = CardItem(
            CourseCode: jsonItem['lecture_code'],
            Title: jsonItem['date'],
            Status: '', // You need to determine how to get the status value
            path: jsonItem['link'],
          );
          cardItems.add(cardItem);
        }
        setState(() {
          Quizzes_side = cardItems; // Save fetched data into Lecture_side list
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
      // Handle error gracefully
    }
  }

Future<void> fetchRecordingCards(String subjectCode) async {
    final url =
        'https://susllms2.000webhostapp.com/student/geteachofsubjectrecording.php?subjectcode=$subjectCode';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // Check if the response was successful
        final jsonResponse = response.body; // Get the response body
        final List<dynamic> jsonList = json.decode(jsonResponse);

        // Process the JSON response and create CardItem instances
        List<CardItem> cardItems = [];
        for (var jsonItem in jsonList) {
          CardItem cardItem = CardItem(
            CourseCode: jsonItem['lecture_code'],
            Title: 'Recording',
            Status: '', // You need to determine how to get the status value
            path: jsonItem['link'],
          );
          cardItems.add(cardItem);
        }
        setState(() {
          Recordings_side = cardItems; // Save fetched data into Lecture_side list
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
      // Handle error gracefully
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
            onPressed: () => navigateToSideNav(context, sideNav()),
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
                          '${widget.subjectCode}',
                          style: Theme.of(context)
                              .textTheme
                              .headline1
                              ?.copyWith(color: Colors.white),
                        ),
                        Text(
                          '${widget.subjectTitle}',
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(color: Colors.white),
                        ),

                        // const SizedBox(
                        //   height: 10,
                        // ),

                        // const SizedBox(
                        //   height: 1,
                        // ),
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
                              height: 10,
                            ),
                            const SizedBox(
                              height: 5,
                              width: 450,
                            ),
                            Text('Lecture Slides',
                                style: Theme.of(context).textTheme.headline2),
                            SizedBox(
                              height: 12,
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 25.0, right: 25.0),
                              height: 130,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: Lecture_side
                                    .length, // Use Lecture_side list length
                                separatorBuilder: (context, _) => SizedBox(
                                  width: 12,
                                ),
                                itemBuilder: (context, index) => InkWell(
                                  // onTap: () {
                                  //   print("Container clicked $index");
                                  //   // Handle onTap
                                  // },
                                  onTap: () async {
                                    if (Lecture_side.isNotEmpty) {
                                      String documentUrl =
                                          'https://susllms2.000webhostapp.com/lecuture/lectureSide/${Lecture_side[index].path}';
                                      if (await canLaunch(documentUrl)) {
                                        await launch(documentUrl);
                                      } else {
                                        throw 'Could not launch $documentUrl';
                                      }
                                    }
                                  },
                                  child:
                                      buildCard(Lecture_side[index], context),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text('Assignment',
                                style: Theme.of(context).textTheme.headline2),
                            SizedBox(
                              height: 12,
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 25.0, right: 25.0),
                              height: 130,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: assignment_side.length,
                                separatorBuilder: (context, _) => SizedBox(
                                  width: 12,
                                ),
                                itemBuilder: (context, index) => InkWell(
                                  onTap: () => navigateToAssignment(
                                      context, assignment_side[index].path),
                                  child: buildCard(
                                      assignment_side[index], context),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text('Quizzes',
                                style: Theme.of(context).textTheme.headline2),
                            SizedBox(
                              height: 12,
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 25.0, right: 25.0),
                              height: 130,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: Quizzes_side.length,
                                separatorBuilder: (context, _) => SizedBox(
                                  width: 12,
                                ),
                                itemBuilder: (context, index) => InkWell(
                                   onTap: () async {
                                      String url = Quizzes_side[index].path;
                                      if (await canLaunch(url)) {
                                        await launch(url);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                "Could not launch the URL."),
                                          ),
                                        );
                                      }
                                    },
                                    child: buildCard(
                                        Quizzes_side[index], context)),
                              ),
                            ),
                             const SizedBox(
                              height: 15,
                            ),
                            Text('Lecture Recordings',
                                style: Theme.of(context).textTheme.headline2),
                            SizedBox(
                              height: 12,
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 25.0, right: 25.0),
                              height: 130,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount:Recordings_side.length,
                                separatorBuilder: (context, _) => SizedBox(
                                  width: 12,
                                ),
                                itemBuilder: (context, index) => InkWell(
                                    onTap: () async {
                                      String url = Recordings_side[index].path;
                                      if (await canLaunch(url)) {
                                        await launch(url);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                "Could not launch the URL."),
                                          ),
                                        );
                                      }
                                    },
                                    child: buildCard(Recordings_side[index], context)),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const SizedBox(
                              height: 5,
                              width: 450,
                            ),
                            const SizedBox(
                              height: 100,
                            ),
                          ]),
                        ),

                        //container
                      ] //children

                      ) //COLUMN

                  ) //CONTAINER
            ]) //COLUMN

            ),

        //SI
        bottomNavigationBar: LMSBottomNavBar(), // NGLESCROLLVIEW
        drawer: sideNav()); //yes
  }
}

Widget buildCard(CardItem item, BuildContext context) {
  var index = 0;
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      //border: Border.all(color: Colors.transparent),
      color: Palette.appBrown,
      // index == 1 ? Colors.red : (index == 2 ? Colors.blue : Colors.green),
    ),
    width: 130,
    height: 130,
    child: Column(
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15)),
                border: Border.all(color: Colors.black54),
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              width: 130,
              height: 80,
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.CourseCode,
                      style: Theme.of(context).textTheme.headline4),
                  SizedBox(
                    height: 3,
                  ),
                  Text(item.Title,
                      style: Theme.of(context).textTheme.headline2),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 14,
        ),
        Text(item.Status,
            style: Theme.of(context)
                .textTheme
                .headline2
                ?.copyWith(color: Colors.white)),
      ],
    ),
  );
}

void navigateToSideNav(BuildContext context, Widget sideNavWidget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => sideNav()),
  );
}

void navigateToAssignment(BuildContext context, String itemId) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => assignment(itemId: itemId)),
  );
}

void navigateTowebview(BuildContext context, String itemId) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => assignment(itemId: itemId)),
  );
}

Future<bool> launchUrl(Uri url, Set<String> set) async {
  if (await canLaunch(url.toString())) {
    await launch(url.toString());
    return true;
  } else {
    return false;
  }
}
