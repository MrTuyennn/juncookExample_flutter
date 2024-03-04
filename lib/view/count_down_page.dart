import 'dart:async';

import 'package:flutter/material.dart';

class CountDown extends StatefulWidget {
  const CountDown({super.key});

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  String remainingTime = "";
  Timer? _timer;
  StreamController<String> timerStream = StreamController<String>.broadcast();
  final endDate = DateTime.now().add(const Duration(
      days: 0, hours: 12, minutes: 15, seconds: 20)); // the date, time u set
  final currentDate = DateTime.now();

  @override
  void initState() {
    prepareData();
    super.initState();
  }

  @override
  void dispose() {
    try {
      if (_timer != null && _timer!.isActive) _timer!.cancel();
    } catch (e) {
      print(e);
    }
    super.dispose();
  }

  prepareData() {
    final difference = daysBetween(currentDate, endDate);
    print(difference);
    print('difference in days');
    // get remaining time in second
    var result = const Duration(seconds: 0);
    result = endDate.difference(currentDate);
    remainingTime = result.inSeconds.toString(); // convert to second
//    remainingTime = '10'; // change this value to test for min function
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  String dayHourMinuteSecondFunction(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String days = twoDigits(duration.inDays);
    String twoDigitHours = twoDigits(duration.inHours.remainder(24));
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return days +
        ' ' +
        "Days" +
        ' ' +
        twoDigitHours +
        ' ' +
        "Hours" +
        ' ' +
        twoDigitMinutes +
        ' ' +
        "Minutes" +
        ' ' +
        twoDigitSeconds +
        "Seconds";
  }

  Widget dateWidget() {
    return StreamBuilder<String>(
        stream: timerStream.stream,
        initialData: "0",
        builder: (cxt, snapshot) {
          const oneSec = Duration(seconds: 1);
          if (_timer != null && _timer!.isActive) _timer!.cancel();
          _timer = Timer.periodic(oneSec, (Timer timer) {
            try {
              int second = int.tryParse(remainingTime) ?? 0;
              second = second - 1;
              if (second < -1) return;
              remainingTime = second.toString();
              if (second == -1) {
                timer.cancel();
                print('timer cancelled');
              }
              if (second >= 0) {
                timerStream.add(remainingTime);
              }
            } catch (e) {
              print(e);
            }
          });
          String remainTimeDisplay = "-";
          try {
            int seconds = int.parse(remainingTime);
            var now = Duration(seconds: seconds);
            remainTimeDisplay = dayHourMinuteSecondFunction(now);
          } catch (e) {
            print(e);
          }
          print(remainTimeDisplay);
          return Text(
            remainTimeDisplay,
            textAlign: TextAlign.center,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                dateWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
