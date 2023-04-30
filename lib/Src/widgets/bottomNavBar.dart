import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/palette.dart';

class LMSBottomNavBar extends StatefulWidget {
  const LMSBottomNavBar({Key? key}) : super(key: key);

  @override
  State<LMSBottomNavBar> createState() => _LMSBottomNavBarState();
}

class _LMSBottomNavBarState extends State<LMSBottomNavBar> {
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
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                }),
            IconBottomBar(
                icon: Icons.notifications_none_outlined,
                selected: _selectedIndex == 1,
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                }),
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
