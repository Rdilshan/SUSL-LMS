import 'package:flutter/material.dart';
import 'package:flutter_application_5/Src/widgets/sideNav.dart';
import 'package:flutter_application_5/Src/widgets/bottomNavBar.dart';
import 'package:flutter_application_5/screen/CourseDetails.dart';
import 'package:flutter_application_5/screen/MyCourses.dart';
import 'package:flutter_application_5/submit_assignment/assignment.dart';
import 'package:flutter_application_5/Src/theme/palette.dart';
import 'package:flutter_application_5/myaccount/myaccount.dart';
import 'package:flutter_application_5/Src/widgets/subjectContainer.dart';
// import 'package:flutter_application_5/CourseDetails.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CardItem {
  final String title;
  final String subtitle;
  final String assignment;
  final String id;

  const CardItem({
    required this.title,
    required this.subtitle,
    required this.assignment,
    required this.id,
  });
}

class Subject {
  final String subName;
  final String subCode;

  Subject({required this.subName, required this.subCode});

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      subName: json['name'] ?? '',
      subCode: json['courseID'] ?? '',
    );
  }
}

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<CardItem> items = [];
  List<Subject> subjects = [];

  @override
  void initState() {
    super.initState();
    fetchAndSetCardItems();
    fetchSubjects();
  }

  Future<void> fetchAndSetCardItems() async {
    List<CardItem> fetchedItems = await fetchCardItems();
    setState(() {
      items = fetchedItems;
    });
  }

  Future<List<CardItem>> fetchCardItems() async {
    final url = Uri.parse(
        'https://susllms2.000webhostapp.com/student/getassignment.php');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Successful request
        final jsonData = jsonDecode(response.body);

        // Create CardItem objects from the JSON data
        List<CardItem> cardItems = [];
        for (var item in jsonData) {
          String title = item['subject'];
          String subtitle = item['title'];
          String assignment = item['type'];
          String id = item['id'];

          CardItem cardItem = CardItem(
            title: title,
            subtitle: subtitle,
            assignment: assignment,
            id: id,
          );

          cardItems.add(cardItem);
        }

        return cardItems;
      } else {
        // Error handling for unsuccessful request
        print('Request failed with status: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      // Exception handling
      print('Exception occurred: $e');
      return [];
    }
  }

  Future<void> fetchSubjects() async {
    final url =
        Uri.parse('https://susllms2.000webhostapp.com/student/getsubject.php');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as List<dynamic>;

        setState(() {
          subjects = jsonData.map((item) => Subject.fromJson(item)).toList();
          // List<Map<String, dynamic>> courses = List<Map<String, dynamic>>.from(json.decode(jsonData as String));
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
    return Container(
      color: Color.fromARGB(255, 255, 255, 255),
      child: SafeArea(
        top: true,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(Icons.menu_rounded),
              iconSize: 40,
              color: Palette.appBrown,
              onPressed: () => navigateToSideNav(context, sideNav()),
            ),
            actions: [
              IconButton(
                onPressed: () => navigateToMyAccount(context, MyAccount()),
                icon: Icon(Icons.account_circle_rounded),
                color: Colors.black54,
                iconSize: 40,
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        left: 15.0,
                        right: 15.0,
                      ),
                      height: 205,
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
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'UPCOMING ACTIVITIES',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          margin:
                              const EdgeInsets.only(left: 25.0, right: 25.0),
                          height: 150,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: items.length,
                            separatorBuilder: (context, _) => SizedBox(
                              width: 12,
                            ),
                            itemBuilder: (context, index) => InkWell(
                              onTap: () => navigateToAssignment(
                                  context, items[index].id),
                              child: buildCard(items[index], context),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        left: 15.0,
                        right: 15.0,
                      ),
                      height: 370,
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
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'RECENTLY ACCESSED COURSES',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          margin:
                              const EdgeInsets.only(left: 25.0, right: 25.0),
                          height: 150,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: subjects.length,
                            separatorBuilder: (context, _) => SizedBox(
                              width: 12,
                            ),
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                print("Container clicked at index $index");
                                
                                final subjectCode = subjects[index].subCode;
                                final subjectTitle = subjects[index].subName;

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

                              child: subjectContainer(
                                subName: subjects[index].subName,
                                subCode: subjects[index].subCode,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin:
                              const EdgeInsets.only(left: 25.0, right: 25.0),
                          height: 150,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: subjects.length,
                            separatorBuilder: (context, _) => SizedBox(
                              width: 12,
                            ),
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                print("Container clicked at index $index");
                                
                                final subjectCode = subjects[index].subCode;
                                final subjectTitle = subjects[index].subName;

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
                              child: subjectContainer(
                                subName: subjects[index].subName,
                                subCode: subjects[index].subCode,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0XFF4D0C04)),
                    fixedSize:
                        MaterialStateProperty.all<Size>(const Size(180, 45)),
                  ),
                  onPressed: () => navigateToMyCourses(context, widget),
                  child: Text(
                    'MY COURSES',
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: LMSBottomNavBar(),
        ),
      ),
    );
  }

  Widget buildCard(CardItem item, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        border: Border.all(color: Colors.transparent),
        color: Palette.appBrown,
      ),
      width: 200,
      height: 200,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  border: Border.all(color: Colors.black54),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                width: 200,
                height: 100,
              ),
              Container(
                padding: EdgeInsets.only(top: 10.0, left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      item.subtitle,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 13,
          ),
          Text(
            item.assignment,
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }

  void navigateToAssignment(BuildContext context, String itemId) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => assignment(itemId: itemId)),
    );
  }

  void navigateToMyAccount(BuildContext context, Widget myaccountWidget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => myaccountWidget),
    );
  }

  void navigateToSideNav(BuildContext context, Widget sideNavWidget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => sideNav()),
    );
  }

  void navigateToMyCourses(BuildContext context, Widget MyCoursesWidget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyCourses()),
    );
  }
}
