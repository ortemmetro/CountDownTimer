import 'package:flutter/material.dart';
import 'dart:async';
import 'create_timer_page.dart';
import 'naw_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          drawer: NavDrawer(),
          appBar: AppBar(
            title: Text('MyTimer'),
            backgroundColor: Colors.black,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.white,
                width: double.infinity,
                height: 200,
                child: Center(
                  child: Text(
                    'MyTimer',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.grey, Colors.white],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: MyTimer(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class MyTimer extends StatefulWidget {
  const MyTimer({Key? key}) : super(key: key);

  @override
  State<MyTimer> createState() => _MyTimerState();
}

class _MyTimerState extends State<MyTimer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Text(
              'You don"t have any timers yet',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
          ),
          Column(
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    side: BorderSide(color: Colors.black, width: 2),
                  )),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateTimerPage()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'Add new timer',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}