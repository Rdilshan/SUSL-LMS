import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/Src/theme/palette.dart';

import '../Src/widgets/subjectContainer.dart';

// ignore_for_file: prefer_const_constructors

class MyCourses extends StatefulWidget {
  const MyCourses({Key? key}) : super(key: key);

  @override
  State<MyCourses> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  var _controller = TextEditingController();
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
              splashColor: Colors.transparent,
              // highlightColor: Colors.transparent,
              icon: const Icon(Icons.menu_rounded),
              iconSize: 40,
              color: Colors.brown,
              onPressed: () {},
            ),
            centerTitle: true,
            title: Text('MY COURSES',
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    ?.copyWith(color: Palette.appBrown)),
            actions: [
              IconButton(
                splashColor: Colors.transparent,
                // highlightColor: Colors.transparent,
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
                  SizedBox(
                    height: 5,
                  ),
                  Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(
                            left: 15.0,
                            right: 15.0,
                          ),
                          height: 680,
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
                          Text('RECENTLY ACCESSED COURSES',
                              style: Theme.of(context).textTheme.headline2),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 26,
                              ),
                              InkWell(
                                onTap: () {
                                  print("Container clicked ");
                                },
                                child: subjectContainer(
                                    subName: 'Network Protocols',
                                    subCode: 'SE3102'),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              subjectContainer(
                                  subName: 'Network Protocols',
                                  subCode: 'SE3102'),
                              SizedBox(
                                width: 12,
                              ),
                              subjectContainer(
                                  subName: 'Network Protocols',
                                  subCode: 'SE3102'),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 26,
                              ),
                              subjectContainer(
                                  subName: 'Network Protocols',
                                  subCode: 'SE3102'),
                              SizedBox(
                                width: 12,
                              ),
                              subjectContainer(
                                  subName: 'Network Protocols',
                                  subCode: 'SE3102'),
                              SizedBox(
                                width: 12,
                              ),
                              subjectContainer(
                                  subName: 'Network Protocols',
                                  subCode: 'SE3102'),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 26,
                              ),
                              subjectContainer(
                                  subName: 'Network Protocols',
                                  subCode: 'SE3102'),
                              SizedBox(
                                width: 12,
                              ),
                              subjectContainer(
                                  subName: 'Network Protocols',
                                  subCode: 'SE3102'),
                              SizedBox(
                                width: 12,
                              ),
                              subjectContainer(
                                  subName: 'Network Protocols',
                                  subCode: 'SE3102'),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 26,
                              ),
                              subjectContainer(
                                  subName: 'Network Protocols',
                                  subCode: 'SE3102'),
                              SizedBox(
                                width: 12,
                              ),
                              subjectContainer(
                                  subName: 'Network Protocols',
                                  subCode: 'SE3102'),
                              SizedBox(
                                width: 12,
                              ),
                              subjectContainer(
                                  subName: 'Network Protocols',
                                  subCode: 'SE3102'),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
