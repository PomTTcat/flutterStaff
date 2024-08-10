import 'package:flutter/material.dart';
import 'dart:async';

class CountdownButton extends StatefulWidget {
  final DateTime endTime; // 结束时间的 DateTime 对象

  const CountdownButton({Key? key, required this.endTime}) : super(key: key);

  @override
  _CountdownButtonState createState() => _CountdownButtonState();
}

class _CountdownButtonState extends State<CountdownButton> {
  Timer? _timer;
  Duration _timeLeft = Duration();

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      setState(() {
        _timeLeft = widget.endTime.difference(now);

        if (_timeLeft.isNegative) {
          _timer?.cancel();
          _timeLeft = Duration.zero; // 当时间差为负值时，计时停止
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    if (duration == Duration.zero) {
      return "受付終了"; // 当倒计时结束时显示
    }
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String hours = twoDigits(duration.inHours);
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return "受付終了まで　$hours:$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 235, 21, 21),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        _formatDuration(_timeLeft),
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}
