import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/Src/theme/palette.dart';

import '../Src/widgets/RecentlyAccesssCourses.dart';
import '../Src/widgets/SubjectBox_MyCourses.dart';
import '../Src/widgets/bottomNavBar.dart';
import '../Src/widgets/sideNav.dart';

// ignore_for_file: prefer_const_constructors

class MyCourses extends StatefulWidget {
  const MyCourses({Key? key}) : super(key: key);

  @override
  State<MyCourses> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 255, 255, 255),
      child: SafeArea(
        top: true,
        child: Scaffold(
            extendBody: true,
            key: scaffoldKey,
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
              ),
              centerTitle: true,
              title: Text('MY COURSES',
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(color: Palette.appBrown)),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.account_circle_rounded),
                  color: Colors.black54,
                  iconSize: 40,
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(
                        left: 15.0,
                        right: 15.0,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 3,
                            )
                          ]),
                      child: TextFormField(
                        controller: _controller,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          border: InputBorder.none,
                          label: Text(
                            'SEARCH COURSES',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          suffixIcon: IconButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onPressed: _controller.clear,
                            icon: Icon(
                              Icons.clear,
                              color: Colors.black38,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.star_border_outlined,
                              size: 28,
                            )),
                        IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.filter_list_rounded,
                              size: 28,
                            )),
                        SizedBox(
                          width: 8,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 15.0, left: 15, bottom: 15, top: 5),
                      child: subGrid(),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: LMSBottomNavBar(),
            drawer: sideNav()),
      ),
    );
  }
}
