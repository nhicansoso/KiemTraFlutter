import 'dart:math';
import 'package:flutter/material.dart';

class ColorDisplayPage extends StatefulWidget {
  const ColorDisplayPage({super.key});

  @override
  State<ColorDisplayPage> createState() => _ColorDisplayPageState();
}

class _ColorDisplayPageState extends State<ColorDisplayPage> {
  //Khai báo biến trạng thái
  Color _currentColor = Colors.orange;
  String _currentName = "Cam";

  //Khai báo màu ban đầu
  final Color _initialColor = Colors.orange;
  final String _initialName = "Cam";

  final Random _random = Random();

  //Hàm đổi màu
  void _changeColor() {
    setState(() {
      _currentColor = Color.fromARGB(
        255,
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
      );
      _currentName = "Màu ngẫu nhiên";
    });
  }

  void _resetColor() {
    setState(() {
      _currentColor = _initialColor;
      _currentName = _initialName;
    });
  }

  // Chọn màu chữ/biểu tượng sao cho tương phản
  Color _contrastColor(Color color) =>
      color.computeLuminance() > 0.5 ? Colors.black : Colors.white;

  @override
  Widget build(BuildContext context) {
    final buttonTextColor = _contrastColor(_currentColor);

    return Scaffold(
      backgroundColor: _currentColor,
      appBar: AppBar(
        title: const Text("Form Đổi màu ngẫu nhiên"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Màu hiện tại:",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              _currentName,
              style: const TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _changeColor,
                  icon: Icon(Icons.color_lens, color: buttonTextColor),
                  label: Text(
                    "Đổi màu",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: buttonTextColor,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonTextColor.withOpacity(0.2),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 12,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: _resetColor,
                  icon: Icon(Icons.refresh, color: buttonTextColor),
                  label: Text(
                    "Đặt lại",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: buttonTextColor,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonTextColor.withOpacity(0.2),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 12,
                    ),
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
