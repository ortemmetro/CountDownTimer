import 'dart:async';
import 'package:count_down_timer/main.dart';
import 'package:flutter/material.dart';

class CreateTimerPage extends StatefulWidget {
  const CreateTimerPage({Key? key}) : super(key: key);

  @override
  State<CreateTimerPage> createState() => _CreateTimerPageState();
}

class _CreateTimerPageState extends State<CreateTimerPage> {
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

  bool _ifVisibleTimerYears = false;
  bool _ifVisibleTimerMonths = false;
  bool _ifVisibleTimerDays = false;
  bool _ifVisibleTimerHours = false;
  bool _ifVisibleTimerMinutes = false;

  DateTime? _dateTime;
  int? _differenceInTime;

  bool _ifVisibleTimer = false;

  bool _ifVisibleForm = true;

  String _textAboveButton = 'Pick your event date:';

  final _textController = TextEditingController();

  String _eventName = '';

  DateTime? _userDate;


void startTimer() {
    setState(() {
      _differenceInTime = _userDate?.difference(DateTime.now()).inSeconds;
      _dateTime = _userDate;
      _startYears = (_differenceInTime! ~/ 31556952.0).toDouble();
      _startMonths =
          ((_differenceInTime! % 31556952.0) ~/ 2592000.0).toDouble();
      _startDays = (((_differenceInTime! % 31556952.0) % 2592000.0) ~/ 86400.0)
          .toDouble();
      _startHours =
          ((((_differenceInTime! % 31556952.0) % 2592000.0) % 86400.0) ~/ 3600)
              .toDouble();
      _startMinutes =
          (((((_differenceInTime! % 31556952.0) % 2592000.0) % 86400.0) %
                      3600) ~/
                  60)
              .toDouble();
      _startSeconds =
          ((((((_differenceInTime! % 31556952.0) % 2592000.0) % 86400.0) %
                          3600) %
                      60) ~/
                  60)
              .toDouble();

      _ifVisibleTimer = true;
      _ifVisibleForm = false;
      _eventName = _textController.text;
      _textAboveButton = 'Time till $_eventName:';

      if (_startYears == 0) {
        _ifVisibleTimerYears = false;
      } else {
        _ifVisibleTimerYears = true;
      }

      if (_startMonths == 0) {
        _ifVisibleTimerMonths = false;
      } else {
        _ifVisibleTimerMonths = true;
      }

      if (_startDays == 0) {
        _ifVisibleTimerDays = false;
      } else {
        _ifVisibleTimerDays = true;
      }

      if (_startHours == 0) {
        _ifVisibleTimerHours = false;
      } else {
        _ifVisibleTimerHours = true;
      }

      if (_startMinutes == 0) {
        _ifVisibleTimerMinutes = false;
      } else {
        _ifVisibleTimerMinutes = true;
      }
    });

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

        if (_startSeconds.toInt().toString().length < 2) {
          setState(() {
            _ifDoubleIntegerSeconds = '0';
          });
        } else {
          setState(() {
            _ifDoubleIntegerSeconds = '';
          });
        }

        if (_startMinutes.toInt().toString().length < 2) {
          setState(() {
            _ifDoubleIntegerMinutes = '0';
          });
        } else {
          setState(() {
            _ifDoubleIntegerMinutes = '';
          });
        }

        if (_startHours.toInt().toString().length < 2) {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
         leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
         ), 
        title: const Text('Create your timer'),
      ),
      body: Center(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Text(
              _textAboveButton,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
          ),
          Visibility(
            visible: _ifVisibleTimer,
            child: Column(
              children: [
                Visibility(
                  visible: _ifVisibleTimerYears,
                  child: Text(
                    '${_startYears.toInt()} Years',
                    style: _timerClockTextStyle,
                  ),
                ),
                Visibility(
                  visible: _ifVisibleTimerMonths,
                  child: Text(
                    '${_startMonths.toInt()} Months',
                    style: _timerClockTextStyle,
                  ),
                ),
                Visibility(
                  visible: _ifVisibleTimerDays,
                  child: Text(
                    '${_startDays.toInt()} Days',
                    style: _timerClockTextStyle,
                  ),
                ),
                Visibility(
                  visible: _ifVisibleTimerHours,
                  child: Text(
                    '$_ifDoubleIntegerHours${_startHours.toInt()} Hours',
                    style: _timerClockTextStyle,
                  ),
                ),
                Visibility(
                  visible: _ifVisibleTimerMinutes,
                  child: Text(
                    '$_ifDoubleIntegerMinutes${_startMinutes.toInt()} Minutes',
                    style: _timerClockTextStyle,
                  ),
                ),
                Text(
                  '$_ifDoubleIntegerSeconds${_startSeconds.toInt()} Seconds',
                  style: _timerClockTextStyle,
                ),
              ],
            ),
          ),
          Visibility(
            visible: _ifVisibleForm,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: ElevatedButton(
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
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(3000),
                      ).then((date) {
                        setState(() {
                          _userDate = date;
                        });
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        'Pick date',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Text('Enter your event name:',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
                TextField(
                  decoration: InputDecoration(),
                  maxLength: 500,
                  controller: _textController,
                ),
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
                  onPressed: startTimer,
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      'Create new timer',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    )
    );
  }
}