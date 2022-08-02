import 'package:flutter/material.dart';
import 'dart:async';
import 'create_timer_page.dart';
import 'naw_drawer.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('MyTimer'),
        backgroundColor: Colors.black,
      ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CreateTimerPage()),
              );
            },
            child: Icon(
              Icons.add,
              size: 40.0,
            ),
          ),
        ),
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
    );
  }
}

class MyTimer extends StatefulWidget {
  const MyTimer({Key? key}) : super(key: key);

  @override
  State<MyTimer> createState() => _MyTimerState();
}

class _MyTimerState extends State<MyTimer> {
  final List<String> user_names = [];
  final List<int> colors = [195, 123];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Text(
              'You don"t have any timers yet',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.5)),
            ),
          ),
          Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.all(5),
                itemCount: user_names.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                  color: Colors.black,
                  thickness: 0.6,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Text(
                      '${user_names[index]}"s birthday:',
                      style: TextStyle(
                        color: Colors.amber[colors[index]],
                        fontSize: 15,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
