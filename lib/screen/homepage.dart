import 'package:flutter/material.dart';
import 'package:flutter_application_5/Src/widgets/SubjectBox_MyCourses.dart';
import 'package:flutter_application_5/screen/MyCourses.dart';
import 'package:flutter_application_5/submit_assignment/assignment.dart';
import 'package:flutter_application_5/Src/widgets/SubjectBox_MyCourses.dart';
import 'package:flutter_application_5/Src/theme/palette.dart';

import '../Src/widgets/RecentlyAccesssCourses.dart';
import '../Src/widgets/bottomNavBar.dart';
import '../Src/widgets/sideNav.dart';

class CardItem {
  final String title;
  final String subtitle;
  final String assignment;

  const CardItem({
    required this.title,
    required this.subtitle,
    required this.assignment,
  });
}

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<CardItem> items = [
    CardItem(
        title: 'SE3101',
        subtitle: 'Report on software design concepts',
        assignment: 'Assignment 1'),
    CardItem(
        title: 'SE3102',
        subtitle: 'Report on software design concepts',
        assignment: 'Assignment 2'),
    CardItem(
        title: 'SE3103',
        subtitle: 'Report on software design concepts',
        assignment: 'Assignment 3'),
    CardItem(
        title: 'SE3104',
        subtitle: 'Report on software design concepts',
        assignment: 'Assignment 1'),
  ];
  bool click = true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        key: scaffoldKey,
        //resizeToAvoidBottomInset: false,
        // extendBody: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.menu_rounded),
            iconSize: 40,
            color: Palette.appBrown,
            onPressed: () {
              if (scaffoldKey.currentState!.isDrawerOpen) {
                scaffoldKey.currentState!.closeDrawer();
                //close drawer, if drawer is open
              } else {
                scaffoldKey.currentState!.openDrawer();
                //open drawer, if drawer is closed
              }
            },
            

    return Container(
      color: Color.fromARGB(255, 255, 255, 255),
      child: SafeArea(
        top: true,
        child: Scaffold(
          //backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(Icons.menu_rounded),
              iconSize: 40,
              color: Palette.appBrown,
              onPressed: () {},
            ),
            actions: [
              IconButton(
                onPressed: () =>
                    navigateTomyaccount(context, const myaccount()),
                icon: Icon(Icons.account_circle_rounded),
                color: Colors.black54,
                iconSize: 40,
              )
                    
          
          ],
        ),
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Stack(children: [
              Column(
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
                          )),
                      Column(
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Text('UPCOMING ACTIVITIES',
                              style: Theme.of(context).textTheme.headline2),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            margin:
                                const EdgeInsets.only(left: 25.0, right: 25.0),
                            height: 150,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              separatorBuilder: (context, _) => SizedBox(
                                width: 12,
                              ),
              


                            itemBuilder: (context, index) => InkWell(
                                onTap: () =>
                    navigateToAssignment(context, const assignment()),
                                  //if (index == 0) {
                                    //navigateToAssignment(
                                        //context, const assignment());
                                 // }
                                },
                                child: buildCard(items[index], context)),
main
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: recentSubGrid(),
                          ),
                          ElevatedButton(
                            onPressed: () => navigateToMycourses(
                                context, const assignment()),
                            // navigateToAssignment(context, const MyCourses()),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0XFF4D0C04)),
                              fixedSize: MaterialStateProperty.all<Size>(
                                  const Size(180, 45)),
                            ),
                            child: Text(
                              'MY COURSES',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  ?.copyWith(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ]),
          ),
        ),
        bottomNavigationBar: LMSBottomNavBar(),
        drawer: sideNav());
  }
}

Widget buildCard(CardItem item, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      //border: Border.all(color: Colors.transparent),
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
                    topLeft: Radius.circular(15)),
                border: Border.all(color: Colors.black54),
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              width: 200,
              height: 100,
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.title,
                      style: Theme.of(context).textTheme.headline1),
                  SizedBox(
                    height: 3,
                  ),
                  Text(item.subtitle,
                      style: Theme.of(context).textTheme.headline4),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 13,
        ),
        Text(item.assignment,
            style: Theme.of(context)
                .textTheme
                .headline2
                ?.copyWith(color: Colors.white)),
      ],
    ),
  );
}

//error
void navigateToAssignment(BuildContext context, Widget assignmentWidget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => assignmentWidget),
  );
}


void navigateToMycourses(BuildContext context, Widget assignmentWidget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MyCourses()),
  );
}
