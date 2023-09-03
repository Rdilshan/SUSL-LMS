import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardItem {
  final String CourseCode;
  final String Title;
  final String Status;

  const CardItem({
    required this.CourseCode,
    required this.Title,
    required this.Status,
  });
}

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<CardItem> items = [
    CardItem(CourseCode: 'SE3101', Title: 'Topic 1', Status: 'New'),
    CardItem(CourseCode: 'SE3102', Title: 'Topic 2', Status: 'Pending'),
    CardItem(CourseCode: 'SE3103', Title: 'Topic 3', Status: 'Completed'),
    CardItem(CourseCode: 'SE3104', Title: 'Topic 4', Status: 'New'),
  ];

  bool click = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
                    Column(
                      children: [
                        SizedBox(
                          height: 12,
                        ),
                        Text('Assignment',
                            style: Theme.of(context).textTheme.headline2),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          margin:
                              const EdgeInsets.only(left: 25.0, right: 25.0),
                          height: 130,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            separatorBuilder: (context, _) => SizedBox(
                              width: 12,
                            ),
                            itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  print("Container clicked $index");
                                  // if (index == 0) {
                                  //   navigateToAssignment(
                                  //       context, const assignment());
                                  // }
                                },
                                child: buildCard(items[index], context)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

Widget buildCard(CardItem item, BuildContext context) {
  var index = 0;
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      //border: Border.all(color: Colors.transparent),
      color:
          index == 1 ? Colors.red : (index == 2 ? Colors.blue : Colors.green),
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
