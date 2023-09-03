import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/Src/theme/palette.dart';
import 'package:flutter_application_5/lectureScreen/AssignmentPage.dart';
import 'package:flutter_application_5/lectureScreen/lecBottombar.dart';


import '../Src/widgets/bottomNavBar.dart';
import '../Src/widgets/sideNav.dart';

class lectureSubject extends StatefulWidget {
  final String subjectCode;
  final String subjectTitle;

  lectureSubject({required this.subjectCode, required this.subjectTitle});

  // const lectureSubject({Key? key}) : super(key: key);

  @override
  State<lectureSubject> createState() => _lectureSubjectState();
}

class _lectureSubjectState extends State<lectureSubject> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
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
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 25.0, right: 25.0),
                            ),
                            SizedBox(
                              height: 15,
                            ),

                            //>>>>>ASSIGNMENT<<<<<
                            InkWell(
                              onTap: () {
                                print("Container clicked at index");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AssignmentPage(
                                      subjectCode: widget.subjectCode,
                                      subjectTitle: "Assignment",
                                    ),
                                  ),
                                );
                              },
                              child: SizedBox(
                                height: 70,
                                width: 380,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 3,
                                          blurRadius: 5,
                                          offset: Offset(0,
                                              0), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 16.0, right: 10.0),
                                        child: Text(
                                          'Assignment',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 10.0),
                                        child: Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          size: 35,
                                          color: Palette.appBrown,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),

                            //>>>>>Quizzes<<<<<
                            InkWell(
                              onTap: () {
                                print("Container clicked at index");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AssignmentPage(
                                      subjectCode: widget.subjectCode,
                                      subjectTitle: "Quizzes",
                                    ),
                                  ),
                                );
                              },
                              child: SizedBox(
                                height: 70,
                                width: 380,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 3,
                                          blurRadius: 5,
                                          offset: Offset(0,
                                              0), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 16.0, right: 10.0),
                                        child: Text(
                                          'Quizzes',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 10.0),
                                        child: Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          size: 35,
                                          color: Palette.appBrown,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 15,
                            ),

                            //>>>>>Lecture Recordings<<<<<
                            InkWell(
                              onTap: () {
                                print("Container clicked at index");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AssignmentPage(
                                      subjectCode: widget.subjectCode,
                                      subjectTitle: "Lecture Recordings",
                                    ),
                                  ),
                                );
                              },
                              child: SizedBox(
                                height: 70,
                                width: 380,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 3,
                                          blurRadius: 5,
                                          offset: Offset(0,
                                              0), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 16.0, right: 10.0),
                                        child: Text(
                                          'Lecture Recordings',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 10.0),
                                        child: Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          size: 35,
                                          color: Palette.appBrown,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 15,
                            ),

                            //>>>>>Lecture Slides<<<<<
                            InkWell(
                              onTap: () {
                                print("Container clicked at index");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AssignmentPage(
                                      subjectCode: widget.subjectCode,
                                      subjectTitle: "Lecture Slides",
                                    ),
                                  ),
                                );
                              },
                              child: SizedBox(
                                height: 70,
                                width: 380,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 3,
                                          blurRadius: 5,
                                          offset: Offset(0,
                                              0), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 16.0, right: 10.0),
                                        child: Text(
                                          'Lecture Slides',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 10.0),
                                        child: Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          size: 35,
                                          color: Palette.appBrown,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Course Details',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            SizedBox(
                              height: 15,
                            ),

                            Row(
                              children: [
                                SizedBox(
                                  width: 35,
                                ),
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 3,
                                            blurRadius: 5,
                                            offset: Offset(0,
                                                0), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 10.0),
                                          child: Icon(
                                            Icons.people,
                                            size: 50,
                                            color: Palette.appBrown,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 2, right: 5, left: 5),
                                          child: Text(
                                            'Enrolled Students',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Stack(
                                          children: [
                                            SizedBox(
                                              height: 38,
                                              width: 150,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Palette.appBrown,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20))),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 10),
                                              child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text('3',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline1
                                                          ?.copyWith(
                                                              color: Colors
                                                                  .white))),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 3,
                                            blurRadius: 5,
                                            offset: Offset(0,
                                                0), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 10.0),
                                          child: Icon(
                                            Icons.calendar_month,
                                            size: 50,
                                            color: Palette.appBrown,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 2, right: 5, left: 5),
                                          child: Text(
                                            'Semester Stared Date',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Stack(
                                          children: [
                                            SizedBox(
                                              height: 38,
                                              width: 150,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Palette.appBrown,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20))),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 10),
                                              child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text('2023 01 01',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline2
                                                          ?.copyWith(
                                                              color: Colors
                                                                  .white))),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 100,
                            )
                          ]),
                        ),
                      ]))
            ])),

        //SI
        bottomNavigationBar: Lecbottom(), // NGLESCROLLVIEW
        drawer: sideNav());
  }
}

void navigateToSideNav(BuildContext context, Widget sideNavWidget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => sideNav()),
  );
}

void navigateToAssignnment(BuildContext context, Widget UploadAssingment) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => UploadAssingment),
  );
}
