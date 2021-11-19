import 'package:flutter/material.dart';
import 'package:training/auth/login.dart';
import 'package:training/screens/notifications.dart';
import 'package:training/screens/profile.dart';
import 'package:training/styles/colors.dart' as color;

class DrawerTab extends StatefulWidget {
  const DrawerTab({Key? key}) : super(key: key);

  @override
  _DrawerTabState createState() => _DrawerTabState();
}

class _DrawerTabState extends State<DrawerTab> {
  final padding = const EdgeInsets.symmetric(
    horizontal: 10,
  );
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: color.AppColor.homePageDetail,
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: padding,
          children: <Widget>[
            Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  buildMenuItem(
                    text: 'Profile',
                    icon: Icons.person,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  buildMenuItem(
                      text: 'Notifications',
                      icon: Icons.notifications,
                      onClicked: () => selectedItem(context, 1)),
                  const SizedBox(
                    height: 16,
                  ),
                  buildMenuItem(
                      text: 'Sign out',
                      icon: Icons.logout_outlined,
                      onClicked: () => selectedItem(context, 2))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  const color = Colors.white;
  final hoverColor = Colors.white70;

  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(text, style: const TextStyle(color: color)),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}

void selectedItem(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ProfileScreen()));
      break;
    case 1:
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const NotificationScreen()));
      break;
    case 2:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
      break;
  }
}
