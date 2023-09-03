import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/Src/theme/palette.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../screen/welcome.dart';

class sideNav extends StatefulWidget {
  @override
  _sideNavState createState() => _sideNavState();
}

class _sideNavState extends State<sideNav> {
  var currentPage = DrawerSections.home;

void logout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('loginResponse');
  await prefs.remove('loginResponselecture');
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => Welcome()),
  );
}

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.home) {
      // container = DashboardPage();
    } else if (currentPage == DrawerSections.help) {
      // container = ContactsPage();
    } else if (currentPage == DrawerSections.privacyPolicy) {
      // container = EventsPage();
    } else if (currentPage == DrawerSections.setting) {
      // container = NotesPage();
    } else if (currentPage == DrawerSections.logout) {
      // container = SettingsPage();
    }
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              MyHeaderDrawer(),
              MyDrawerList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 0,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "HOME", Icons.home_outlined,
              currentPage == DrawerSections.home ? true : false),
          menuItem(2, "HELP", Icons.help_outline,
              currentPage == DrawerSections.help ? true : false),
          menuItem(3, "PRIVACY POLICY", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacyPolicy ? true : false),
          menuItem(4, "SETTINGS", Icons.settings_outlined,
              currentPage == DrawerSections.setting ? true : false),
          menuItem(5, "LOGOUT", Icons.logout,
              currentPage == DrawerSections.setting ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.home;
            } else if (id == 2) {
              currentPage = DrawerSections.help;
            } else if (id == 3) {
              currentPage = DrawerSections.privacyPolicy;
            } else if (id == 4) {
              currentPage = DrawerSections.setting;
            } else if (id == 5) {
              currentPage = DrawerSections.logout;
              logout();
              
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 25,
                  color: Palette.appBrown,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(title,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(color: Colors.black45)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



enum DrawerSections {
  home,
  help,
  privacyPolicy,
  setting,
  logout,
}

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white12,
      width: double.infinity,
      height: 300,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 0, top: 25),
            height: 170,
            decoration: BoxDecoration(
              //shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('Assets/images/logo_2.png'),
              ),
            ),
          ),
          // SizedBox(
          //   height: 50,
          // ),
          // Divider(
          //   color: Colors.black,
          // )
        ],
      ),
    );
  }
}
