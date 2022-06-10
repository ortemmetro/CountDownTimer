import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('Timer'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            color: Colors.greenAccent,
            height: 200,
            child: Center(
              child: Text(
                'Timer',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Center(
                child: MyTimer(),
              ),
            ],
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
  final _timerClockTextStyle = const TextStyle(fontSize: 50);

  Timer _timer = Timer(const Duration(seconds: 0), () {});
  int _startSeconds = 10;
  String _ifDoubleIntegerSeconds = '';
  int _startMinutes = 1;
  String _ifDoubleIntegerMinutes = '';
  int _startHours = 0;
  String _ifDoubleIntegerHours = '';
  int _startDays = 0;
  int _startMonths = 0;
  int _startYears = 2;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_startSeconds == 0) {
          setState(() {
            _startMinutes--;
            _startSeconds = 59;
          });
          if(_startMinutes == -1){
            setState(() {
              _startHours--;
              _startMinutes = 59;
            });
            if(_startHours == -1){
              setState(() {
                _startDays--;
                _startHours = 23;
              });
              if(_startDays == -1){
                setState(() {
                  _startMonths--;
                  _startDays = 29;
                });
                if(_startMonths == -1){
                  setState(() {
                    _startYears--;
                    _startMonths = 12;
                  });
                }
              }
            }
          }
        } else {
          setState(() {
            _startSeconds--;
          });
        }

        if (_startSeconds.toString().length < 2) {
          setState(() {
            _ifDoubleIntegerSeconds = '0';
          });
        } else {
          setState(() {
            _ifDoubleIntegerSeconds = '';
          });
        }

        if (_startMinutes.toString().length < 2) {
          setState(() {
            _ifDoubleIntegerMinutes = '0';
          });
        } else {
          setState(() {
            _ifDoubleIntegerMinutes = '';
          });
        }

        if (_startHours.toString().length < 2) {
          setState(() {
            _ifDoubleIntegerHours = '0';
          });
        } else {
          setState(() {
            _ifDoubleIntegerHours = '';
          });
        }

      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple, Colors.blue],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          ),
      ),
      child: Center(
        child: Column(
          children: [
            const Text(
              'Time left till your birthday:',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            Column(
              children: [
                Text(
                  '$_startYears Years',
                  style: _timerClockTextStyle,
                ),
                Text(
                  '$_startMonths Months',
                  style: _timerClockTextStyle,
                ),
                Text(
                  '$_startDays Days',
                  style: _timerClockTextStyle,
                ),
                Text(
                  '$_ifDoubleIntegerHours$_startHours Hours',
                  style: _timerClockTextStyle,
                ),
                Text(
                  '$_ifDoubleIntegerMinutes$_startMinutes Minutes',
                  style: _timerClockTextStyle,
                ),
                Text(
                  '$_ifDoubleIntegerSeconds$_startSeconds Seconds',
                  style: _timerClockTextStyle,
                ),
              ],
            ),
            ElevatedButton(
              child: const Text('Tap me'),
              onPressed: startTimer,
            ),
            Text('Checking github time 2'),
          ],
        ),
      ),
    );
  }
}