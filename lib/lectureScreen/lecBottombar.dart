import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/Src/theme/palette.dart';
import 'package:flutter_application_5/lectureScreen/N_Lec_MyCourses.dart';
import 'package:flutter_application_5/notifications/notifications.dart';



class Lecbottom extends StatefulWidget {
  const Lecbottom({ super.key });

  @override
  State<Lecbottom> createState() => _LecbottomState();
}

class _LecbottomState extends State<Lecbottom> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
        return SafeArea(
      child: Container(
        height: 60,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
        decoration: BoxDecoration(
            color: Palette.navBar,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 8,
              )
            ],
            borderRadius: BorderRadius.all(Radius.circular(24))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconBottomBar(
                icon: Icons.home_outlined,
                selected: _selectedIndex == 0,
                onPressed: () => navigateToHomepage2(context, Lec_MyCourses())),
            IconBottomBar(
                icon: Icons.notifications_none_outlined,
                selected: _selectedIndex == 1,
                onPressed: () =>
                    navigateToNotifications(context, notifications())),
            IconBottomBar(
                icon: Icons.message_outlined,
                selected: _selectedIndex == 2,
                onPressed: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                }),
          ],
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  IconBottomBar(
      {Key? key,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);

  final IconData icon;
  final bool selected;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
        padding: EdgeInsets.all(0),
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: selected ? Colors.white : Colors.grey,
          size: 35,
        ),
      ),
    );
  }
}

navigateToHomepage2(BuildContext context, Widget homepageWidget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => homepageWidget),
  );
}

navigateToNotifications(BuildContext context, Widget notificationsWidget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => notifications()),
  );
}
