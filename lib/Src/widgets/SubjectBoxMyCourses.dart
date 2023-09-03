import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_5/Src/theme/palette.dart';
import 'package:flutter_application_5/screen/CourseDetails.dart';
import 'package:http/http.dart' as http;

class subGrid extends StatefulWidget {
  const subGrid({Key? key}) : super(key: key);

  @override
  State<subGrid> createState() => _subGridState();
}

class _subGridState extends State<subGrid> {
  List<Map<String, dynamic>> gridMap = [];

  @override
  void initState() {
    super.initState();
    fetchSubjects();
  }

  Future<void> fetchSubjects() async {
    final url =
        Uri.parse('https://susllms2.000webhostapp.com/student/getsubject.php');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as List<dynamic>;
        setState(() {
          gridMap = jsonData.cast<Map<String, dynamic>>();
          
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double a = 0;
    String? b;
    int itemCount = gridMap.length;

    if (itemCount % 3 == 0) {
      a = itemCount / 3;
    } else if (itemCount % 3 == 1) {
      a = (itemCount / 3);
      b = a.toStringAsFixed(0);
      a = double.parse(b!) + 1;
    } else {
      a = (itemCount / 3);
      b = a.toStringAsFixed(0);
      a = double.parse(b!);
    }

    return Stack(
      children: [
        Container(
          height: (162 * a),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 8,
              ),
            ],
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                  mainAxisExtent: 150,
                ),
                itemCount: itemCount,
                itemBuilder: (_, index) {
                  final subName = gridMap.elementAt(index)['name'] as String?;
                  final subCode = gridMap.elementAt(index)['courseID'] as String?;

                  return InkWell(
                    onTap: () {
                        print("Container clicked at index $index");
                        
                       String subjectCode = subCode ?? '';
                       String subjectTitle = subName ?? '';

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CourseDetails(
                              subjectCode: subjectCode,
                              subjectTitle: subjectTitle,
                            ),
                          ),
                        );
                      },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Colors.black,
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                  color: Palette.appBrown,
                                ),
                                height: 100,
                                width: double.infinity,
                                child: Stack(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: width / 5.5,
                                          height: 20,
                                          child: const DecoratedBox(
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 35.0,
                                          height: 10,
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0),
                                            onPressed: null,
                                            icon: Icon(
                                              Icons.star_border,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                        right: 20,
                                        top: 25,
                                        left: 5,
                                      ),
                                      child: Container(
                                        child: Text(
                                          subName ?? '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3
                                              ?.copyWith(
                                                  color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            subCode ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: subGrid(),
  ));
}