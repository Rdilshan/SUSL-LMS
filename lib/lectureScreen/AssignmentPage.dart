import 'dart:collection';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/lectureScreen/UploadAssignment.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Src/theme/palette.dart';
import '../Src/theme/palette.dart';
import '../Src/theme/palette.dart';
import '../screen/homepage.dart';
import '../submit_assignment/assignment.dart';
import 'package:http/http.dart' as http;

class AssignmentPage extends StatefulWidget {
  final String subjectCode;
  final String subjectTitle;

  AssignmentPage({required this.subjectCode, required this.subjectTitle});

  @override
  State<AssignmentPage> createState() => _AssignmentPageState();
}

class _AssignmentPageState extends State<AssignmentPage> {
  // List<Subject> Subjects = [
  //   Subject.Subjects("Assignment 1", "Topic")

  // ];
  List<Subject> Subjects = [];
  List<Subject> Quizzes = [];

  HashSet<Subject> selectedItem = HashSet();
  bool isMultiSelectionEnabled = false;

  @override
  void initState() {
    super.initState();
    if (widget.subjectTitle == "Assignment") {
      fetchAssignmentCards(widget.subjectCode);
    }

    if (widget.subjectTitle == "Quizzes") {
      fetchquizzcards(widget.subjectCode);
    }

    if (widget.subjectTitle == "Lecture Recordings") {
      fetchRecordingCards(widget.subjectCode);
    }

    if (widget.subjectTitle == "Lecture Slides") {
      fetchLectureCards(widget.subjectCode);
    }
  }

  Future<void> fetchAssignmentCards(String subjectCode) async {
    final url =
        'https://susllms2.000webhostapp.com/lecuture/getlectureAssigment.php?subjectcode=$subjectCode';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonResponse = response.body;
        final List<dynamic> jsonList = json.decode(jsonResponse);

        List<Subject> subjectItems = [];
        for (var jsonItem in jsonList) {
          Subject subject = Subject.Subjects(
            jsonItem['subject'], // Replace with actual field names
            jsonItem['type'],
            jsonItem['attachment'], // Replace with actual field names
          );
          subjectItems.add(subject);
        }
        setState(() {
          Subjects = subjectItems; // Update Subjects list with fetched data
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
        'https://susllms2.000webhostapp.com/lecuture/getlectureQuize.php?subjectcode=$subjectCode';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // Check if the response was successful
        final jsonResponse = response.body; // Get the response body
        final List<dynamic> jsonList = json.decode(jsonResponse);

        List<Subject> subjectItems = [];
        for (var jsonItem in jsonList) {
          Subject subject = Subject.Subjects(
            jsonItem['lecture_code'], // Replace with actual field names
            jsonItem['date'],
            jsonItem['link'], // Replace with actual field names
          );
          subjectItems.add(subject);
        }
        setState(() {
          Subjects = subjectItems; // Update Subjects list with fetched data
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
        'https://susllms2.000webhostapp.com/lecuture/getlectureLetureRecording.php?subjectcode=$subjectCode';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // Check if the response was successful
        final jsonResponse = response.body; // Get the response body
        final List<dynamic> jsonList = json.decode(jsonResponse);

        // Process the JSON response and create CardItem instances
        List<Subject> subjectItems = [];
        for (var jsonItem in jsonList) {
          Subject subject = Subject.Subjects(
            jsonItem['lecture_code'], // Replace with actual field names
            jsonItem['date'],
            jsonItem['link'], // Replace with actual field names
          );
          subjectItems.add(subject);
        }
        setState(() {
          Subjects = subjectItems; // Update Subjects list with fetched data
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
      // Handle error gracefully
    }
  }

  Future<void> fetchLectureCards(String subjectCode) async {
    final url =
        'https://susllms2.000webhostapp.com/lecuture/getLectureSideLecture.php?subjectcode=$subjectCode';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonResponse = response.body;
        final List<dynamic> jsonList = json.decode(jsonResponse);

        List<Subject> subjectItems = [];
        for (var jsonItem in jsonList) {
          Subject subject = Subject.Subjects(
            "Lecture Side", // Replace with actual field names
            jsonItem['title'],
            jsonItem['path'], // Replace with actual field names
          );
          subjectItems.add(subject);
        }
        setState(() {
          Subjects = subjectItems; // Update Subjects list with fetched data
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
      // Handle error gracefully
    }
  }

  // delecting operator

  Future<void> AssignmentDelect(link) async {
    final url = Uri.parse(
        'https://susllms2.000webhostapp.com/lecuture/AssignmentDelect.php');
    final Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    final Map<String, dynamic> postData = {
      'link': link,
    };

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: postData,
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print("value --> $responseData");
        if (responseData['status'] == '1') {
          print("Suceessful delecting");
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> QuizzesDelect(link) async {
    final url =
        Uri.parse('https://susllms2.000webhostapp.com/lecuture/quizdelect.php');
    final Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    final Map<String, dynamic> postData = {
      'link': link,
    };

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: postData,
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print("value --> $responseData");
        if (responseData['status'] == '1') {
          print("Suceessful delecting");
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> LecturesRecordingDelect(link) async {
    final url =
        Uri.parse('https://susllms2.000webhostapp.com/lecuture/lectureRecordingDelect.php');
    final Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    final Map<String, dynamic> postData = {
      'link': link,
    };

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: postData,
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print("value --> $responseData");
        if (responseData['status'] == '1') {
          print("Suceessful delecting");
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }


  Future<void> LecturesSlideDelect(link) async {
    final url =
        Uri.parse('https://susllms2.000webhostapp.com/lecuture/lectureSlideDelect.php');
    final Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    final Map<String, dynamic> postData = {
      'link': link,
    };

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: postData,
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print("value --> $responseData");
        if (responseData['status'] == '1') {
          print("Suceessful delecting");
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        centerTitle: isMultiSelectionEnabled ? false : true,
        leading: isMultiSelectionEnabled
            ? IconButton(
                onPressed: () {
                  selectedItem.clear();
                  isMultiSelectionEnabled = false;
                  setState(() {});
                },
                icon: Icon(Icons.close))
            : null,
        title: Text(isMultiSelectionEnabled
            ? getSelectedItemCount()
            : "${widget.subjectCode}-${widget.subjectTitle}"),
        actions: [
          Visibility(
            visible: selectedItem.isNotEmpty,
            child: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                for (int index
                    in selectedItem.map((sub) => Subjects.indexOf(sub))) {
                  if (index >= 0 && index < Subjects.length) {
                    if (widget.subjectTitle == "Assignment") {
                      AssignmentDelect(Subjects[index].path);
                    }

                    if (widget.subjectTitle == "Quizzes") {
                      QuizzesDelect(Subjects[index].path);
                    }

                    if (widget.subjectTitle == "Lecture Recordings") {
                      LecturesRecordingDelect(Subjects[index].path);
                    }

                    if (widget.subjectTitle == "Lecture Slides") {
                      LecturesSlideDelect(Subjects[index].path);
                    }
                    Subjects.removeAt(index);
                  }
                }
                selectedItem.clear();
                setState(() {});
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: ElevatedButton(
                  onPressed: () {
                    print("go to upload");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UploadAssingment(
                          subjectCode: widget.subjectCode,
                          subjectTitle: widget.subjectTitle,
                        ),
                      ),
                    );
                  }, // navigateToAssignment(context, const MyCourses()),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0XFF4D0C04)),
                    fixedSize:
                        MaterialStateProperty.all<Size>(const Size(240, 45)),
                  ),
                  child: Text(
                    'Upload New ',
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: List.generate(Subjects.length, (index) {
                Subject nature = Subjects[index];
                return Card(
                  elevation: 10,
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 5,
                      bottom: 5,
                    ),
                    height: 70.0,
                    child: getListItem(nature, index),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  String getSelectedItemCount() {
    return selectedItem.isNotEmpty
        ? selectedItem.length.toString() + " item selected"
        : "No item selected";
  }

  void doMultiSelection(Subject subject) {
    if (isMultiSelectionEnabled) {
      if (selectedItem.contains(subject)) {
        selectedItem.remove(subject); // Deselect if already selected
      } else {
        selectedItem.add(subject); // Select if not already selected
      }
      setState(() {}); // Notify the UI that the selection has changed
    } else {
      // Other logic when multi-selection is not enabled
    }
  }

  InkWell getListItem(Subject subject, int index) {
    return InkWell(
        onTap: () async {
          if (widget.subjectTitle == "Assignment") {
            if (Subjects.isNotEmpty && index < Subjects.length) {
              String documentUrl =
                  'https://susllms2.000webhostapp.com/Assignment/lecture/${Subjects[index].path}';
              if (await canLaunch(documentUrl)) {
                await launch(documentUrl);
              } else {
                print('Could not launch $documentUrl');
              }
            }
          } else if (widget.subjectTitle == "Quizzes" ||
              widget.subjectTitle == "Lecture Recordings") {
            String url = Subjects[index].path;
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Could not launch the URL."),
                ),
              );
            }
          } else if (widget.subjectTitle == "Lecture Slides") {
            if (Subjects.isNotEmpty && index < Subjects.length) {
              String documentUrl =
                  'https://susllms2.000webhostapp.com/lecuture/lectureSide/${Subjects[index].path}';
              if (await canLaunch(documentUrl)) {
                await launch(documentUrl);
              } else {
                print('Could not launch $documentUrl');
              }
            }
          }
        },
        onLongPress: () {
          isMultiSelectionEnabled = true;
          // print("delect");
          doMultiSelection(subject);
        },
        child: Stack(alignment: Alignment.centerRight, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(subject.Coursecode,
                          style: Theme.of(context).textTheme.headline4),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        subject.CourseName,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Visibility(
              visible: isMultiSelectionEnabled,
              child: Icon(
                selectedItem.contains(subject)
                    ? Icons.check_circle
                    : Icons.radio_button_unchecked,
                size: 30,
                color: Palette.appBrown,
              ))
        ]));
  }
}

class Subject {
  final String Coursecode;
  final String CourseName;
  final String path;

  Subject.Subjects(this.Coursecode, this.CourseName, this.path);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Subject && runtimeType == other.runtimeType;
}

void navigateToMycourses(BuildContext context, Widget myaccountWidget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => myaccountWidget),
  );
}
