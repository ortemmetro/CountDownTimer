import 'package:flutter/material.dart';
import 'dart:async';
import 'create_timer_page.dart';
import 'main.dart';

class NavDrawer extends StatelessWidget {
  final _drawerTextStyle = TextStyle(fontSize: 20);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      child: Drawer(
          child: Column(
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.all(45.0),
            child: Stack(
              children: [
                Text(
                  'MyTimer',
                  style: TextStyle(
                    fontSize: 35,
                    letterSpacing: 3,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 8
                      ..color = Colors.black,
                  ),
                ),
                const Text(
                  'MyTimer',
                  style: TextStyle(
                    fontSize: 35,
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/clockwatch.jpg'))),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.fromLTRB(15, 1.5, 10, 1.5),
                  leading: Icon(
                    Icons.verified_user,
                    size: 30,
                  ),
                  title: Text('Profile', style: _drawerTextStyle),
                ),
                Divider(
                  thickness: 1.6,
                ),
                ListTile(
                  contentPadding: EdgeInsets.fromLTRB(15, 1.5, 10, 1.5),
                  leading: Icon(
                    Icons.settings,
                    size: 30,
                  ),
                  title: Text('Settings', style: _drawerTextStyle),
                ),
                Divider(
                  thickness: 1.6,
                ),
                ListTile(
                  contentPadding: EdgeInsets.fromLTRB(15, 1.5, 10, 1.5),
                  leading: Icon(
                    Icons.border_color,
                    size: 30,
                  ),
                  title: Text('Feedback', style: _drawerTextStyle),
                ),
                Divider(
                  thickness: 1.6,
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: ListTile(
                      contentPadding: EdgeInsets.fromLTRB(15, 1.5, 10, 1.5),
                      leading: Icon(
                        Icons.exit_to_app,
                        size: 30,
                      ),
                      title: Text('Logout', style: _drawerTextStyle),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}