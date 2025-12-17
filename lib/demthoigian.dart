import 'dart:async';
import 'package:flutter/material.dart';

class Demthoigian extends StatefulWidget {
  const Demthoigian({super.key});

  @override
  _DemthoigianState createState() => _DemthoigianState();
}

class _DemthoigianState extends State<Demthoigian> {
  int _counter = 0; //biến đếm thời gian = 0 giây
  late Timer _timer; //bộ đếm thời gian
  bool _isRunning = false; //kiểm tra trạng thái bộ đếm
  final TextEditingController _controller = TextEditingController();

  void _startTimer() {
    int duration =
        int.tryParse(_controller.text) ??
        0; //lấy số giây nhập vào chuyển từ text->số, nếu sai thì mặc định 0
    if (duration > 0) {
      //cập nhật state ban đầu
      setState(() {
        _counter = duration;
        _isRunning = true;
      });
      //Chạy lặp lại, cho mình 1s trôi qua
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_counter > 0) {
          setState(() {
            _counter--;
          });
        } else {
          _timer.cancel();
          setState(() {
            _isRunning = false;
          });
        }
      });
    }
  }

  void _resetTimer() {
    setState(() {
      _counter = 0;
      _isRunning = false;
    });
    _timer.cancel();
  }

  String get _formattedTime {
    int minutes = _counter ~/ 60; //chia lấy nguyên
    int seconds = _counter % 60; //chia lấy dư
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}'; //1:9 --> 01:09
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bộ đếm thời gian'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              'Bộ đếm thời gian',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Nhập số giây cần đếm:',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              _formattedTime,
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _isRunning
                      ? null
                      : _startTimer, // Chỉ cho phép bắt đầu khi bộ đếm chưa chạy
                  child: const Text('Bắt đầu'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _resetTimer,
                  child: const Text('Đặt lại'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
