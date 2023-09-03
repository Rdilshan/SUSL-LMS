import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/lectureScreen/N_Lec_MyCourses.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class UploadAssingment extends StatefulWidget {
  final String subjectCode;
  final String subjectTitle;

  UploadAssingment({required this.subjectCode, required this.subjectTitle});

  @override
  State<UploadAssingment> createState() => _UploadAssingmentState();
}

class _UploadAssingmentState extends State<UploadAssingment> {
  TextEditingController titelfornewupload = TextEditingController();
  TextEditingController typefornewupload = TextEditingController();
  TextEditingController descriptionrnewupload = TextEditingController();
  TextEditingController Finishdaternewupload = TextEditingController();
  TextEditingController UploadLinknewupload = TextEditingController();

  @override
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
        fileToDisplay = File(pickedfile!.path!);

        print('File Name : $_fileName');
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }


  Future<void> assignment() async {
    String enteredText = titelfornewupload.text;
    String typeEnter = typefornewupload.text;
    String description = descriptionrnewupload.text;
    String deadline = Finishdaternewupload.text;


    SharedPreferences prefs = await SharedPreferences.getInstance();
    var myData = prefs.getString('loginResponselecture');

    if (myData != null) {
      myData = myData.trim(); // Remove leading/trailing whitespace
      // print('Stored data: $myData');
    } else {
      print('No data found.');
    }

    final url = Uri.parse(
        'https://susllms2.000webhostapp.com/lecuture/addnewassignment.php');

    try {
      var request = http.MultipartRequest('POST', url);
      request.headers['Content-Type'] = 'application/x-www-form-urlencoded';

      request.fields['id'] = myData!;
      request.fields['subjectcode'] = widget.subjectCode;

      request.fields['type'] = typeEnter;
      request.fields['description'] = description;
      request.fields['finishDate'] = deadline;
      request.fields['title'] = enteredText;

      if (fileToDisplay != null) {
        var fileStream =
            http.ByteStream(Stream.castFrom(fileToDisplay!.openRead()));
        var length = await fileToDisplay!.length();
        request.files.add(http.MultipartFile(
          'file',
          fileStream,
          length,
          filename: _fileName!,
        ));
      }

      var response = await request.send();

      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        print("value --> $responseData");
        var jsonResponse = jsonDecode(responseData);
        if (jsonResponse['status'] == '1') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Lec_MyCourses()),
          );
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> quizzes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var myData = prefs.getString('loginResponselecture');

    if (myData != null) {
      myData = myData.trim(); // Remove leading/trailing whitespace
      // print('Stored data: $myData');
    } else {
      print('No data found.');
    }

    String link = UploadLinknewupload.text;

    final url = Uri.parse(
        'https://susllms2.000webhostapp.com/lecuture/addnewquizz.php');
    final Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    final Map<String, dynamic> postData = {
      'id': myData,
      'link': link,
      'subjectcode': widget.subjectCode,
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Lec_MyCourses()),
          );
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> lectureRecording() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var myData = prefs.getString('loginResponselecture');

    if (myData != null) {
      myData = myData.trim(); // Remove leading/trailing whitespace
      // print('Stored data: $myData');
    } else {
      print('No data found.');
    }

    String link = UploadLinknewupload.text;

    final url = Uri.parse(
        'https://susllms2.000webhostapp.com/lecuture/addnewrecording.php');
    final Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    final Map<String, dynamic> postData = {
      'id': myData,
      'link': link,
      'subjectcode': widget.subjectCode,
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Lec_MyCourses()),
          );
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> lectureSlide() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var myData = prefs.getString('loginResponselecture');

    if (myData != null) {
      myData = myData.trim(); // Remove leading/trailing whitespace
      // print('Stored data: $myData');
    } else {
      print('No data found.');
    }

    String enteredText = titelfornewupload.text;

    final url = Uri.parse(
        'https://susllms2.000webhostapp.com/lecuture/addnewlectureSilde.php');

    try {
      var request = http.MultipartRequest('POST', url);
      request.headers['Content-Type'] = 'application/x-www-form-urlencoded';

      request.fields['id'] = myData!;
      request.fields['title'] = enteredText;
      request.fields['subjectcode'] = widget.subjectCode;

      if (fileToDisplay != null) {
        var fileStream =
            http.ByteStream(Stream.castFrom(fileToDisplay!.openRead()));
        var length = await fileToDisplay!.length();
        request.files.add(http.MultipartFile(
          'file',
          fileStream,
          length,
          filename: _fileName!,
        ));
      }

      var response = await request.send();

      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        print("value --> $responseData");
        var jsonResponse = jsonDecode(responseData);
        if (jsonResponse['status'] == '1') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Lec_MyCourses()),
          );
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
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          title: Text(
            "Upload New",
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                if (widget.subjectTitle == 'Assignment')
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Type:',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(color: Colors.black54),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: typefornewupload,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(12),
                          hintText: 'Type your text here...',
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Text(
                        'Description:',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(color: Colors.black54),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: descriptionrnewupload,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(12),
                          hintText: 'Type your description...',
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Text(
                        'Finish date:',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(color: Colors.black54),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: Finishdaternewupload,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(12),
                          hintText: 'Type your date (2024-05-10)...',
                        ),
                      ),
                    ],
                  ),
                const SizedBox(
                  height: 13,
                ),
                if (widget.subjectTitle == 'Assignment' ||
                    widget.subjectTitle == 'Lecture Slides')
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Title:',
                          textAlign: TextAlign.left,
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(color: Colors.black54),
                          //textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: titelfornewupload,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(12),
                            hintText: 'Type your text here...',
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Upload Document',
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(color: Colors.black54),
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
                                    fixedSize: MaterialStateProperty.all<Size>(
                                        const Size(250, 70)),
                                  ),
                                  child: const Text(
                                    'UPLOAD FILES',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 15,
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ]),
                if (widget.subjectTitle == 'Quizzes' ||
                    widget.subjectTitle == 'Lecture Recordings')
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'UploadLink:',
                        textAlign: TextAlign.left,
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(color: Colors.black54),
                        //textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: UploadLinknewupload,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(12),
                          hintText: 'Type your UploadLink...',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ElevatedButton(
                  onPressed: () {
                    if (widget.subjectTitle == 'Assignment') {
                      assignment();
                    }
                    if (widget.subjectTitle == 'Quizzes') {
                      quizzes();
                    }

                    if (widget.subjectTitle == 'Lecture Recordings') {
                      lectureRecording();
                    }

                    if (widget.subjectTitle == 'Lecture Slides') {
                      lectureSlide();
                    }
                  },
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
            ),
          ),
        ));
  }
}
