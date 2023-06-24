import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_application_5/Src/theme/theme.dart';

class subjectContainer extends StatelessWidget {
  final String subName;
  final String subCode;

  subjectContainer({Key? key, required this.subName, required this.subCode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      width: 112,
      height: 150,
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
                  color: Color.fromARGB(255, 77, 12, 4),
                ),
                width: 118,
                height: 100,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.0, left: 10.0),
                    child: Text(
                      subName,
                      style: Theme.of(context).textTheme.headline3?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 77.0,
                    height: 40,
                    child: const DecoratedBox(
                      decoration:
                          const BoxDecoration(color: Colors.transparent),
                    ),
                  ),
                  SizedBox(
                    width: 35.0,
                    height: 40,
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
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Text(subCode,
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  ?.copyWith(color: Colors.white)),
        ],
      ),
    );
  }
}
