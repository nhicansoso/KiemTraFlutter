import 'package:flutter/material.dart';

class DemsoPage extends StatefulWidget {
  const DemsoPage({super.key});

  @override
  State<DemsoPage> createState() => _DemsoPageState();
}

class _DemsoPageState extends State<DemsoPage> {
  int _counter = 0; // giá trị hiện tại

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      _counter--;
    });
  }

  void _reset() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ứng dụng đếm số"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Giá trị hiện tại:", style: TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            Text(
              '$_counter', //hiển thị giá trị counter
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFF0000),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Nút tăng
                ElevatedButton(
                  onPressed: _increment,
                  child: const Text("Tăng", style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Đặt màu nền cho nút
                  ),
                ),
                const SizedBox(width: 20),
                // Nút đặt lại
                ElevatedButton(
                  onPressed: _reset,
                  child: const Text("Đặt lại", style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                ),
                const SizedBox(width: 20),
                // Nút giảm
                ElevatedButton(
                  onPressed: _decrement,
                  child: const Text("Giảm", style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
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
