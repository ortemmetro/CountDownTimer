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
  double _startSeconds = 0;
  String _ifDoubleIntegerSeconds = '';
  double _startMinutes = 0;
  String _ifDoubleIntegerMinutes = '';
  double _startHours = 0;
  String _ifDoubleIntegerHours = '';
  double _startDays = 0;
  double _startMonths = 0;
  double _startYears = 0;

  DateTime? _dateTime;
  int? _differenceInTime;

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
          if (_startMinutes == -1) {
            setState(() {
              _startHours--;
              _startMinutes = 59;
            });
            if (_startHours == -1) {
              setState(() {
                _startDays--;
                _startHours = 23;
              });
              if (_startDays == -1) {
                setState(() {
                  _startMonths--;
                  _startDays = 29;
                });
                if (_startMonths == -1) {
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
      padding: const EdgeInsets.only(top: 20),
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
            Text(
              _dateTime == null
                  ? 'Choose your event date'
                  : '$_differenceInTime',
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(3000),
                ).then((date) {
                  setState(() {
                    _differenceInTime = date?.difference(DateTime.now()).inSeconds;
                    _dateTime = date;
                    _startYears = (_differenceInTime! ~/ 31556952.0).toDouble();
                    _startMonths = ((_differenceInTime! % 31556952.0) ~/ 2592000.0).toDouble();
                    _startDays = (((_differenceInTime! % 31556952.0) % 2592000.0) ~/ 86400.0).toDouble();
                    _startHours = ((((_differenceInTime! % 31556952.0) % 2592000.0) % 86400.0) ~/ 3600).toDouble();
                    _startMinutes = (((((_differenceInTime! % 31556952.0) % 2592000.0) % 86400.0) % 3600) ~/ 60).toDouble();
                    _startSeconds = ((((((_differenceInTime! % 31556952.0) % 2592000.0) % 86400.0) % 3600) % 60) ~/ 60).toDouble();
                  });
                });
              },
              child: Text('Pick date'),
            ),
          ],
        ),
      ),
    );
  }
}
