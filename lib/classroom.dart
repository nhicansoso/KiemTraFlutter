import 'package:flutter/material.dart';

class ClassroomPage extends StatelessWidget {
  const ClassroomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Danh sách môn học")),
      body: Column(
        children: [
          block(
            title: "XML và ứng dụng - Nhóm 1",
            code: "2025-2026.1.TIN4583.001",
            students: "58 học viên",
            color: Colors.purple,
          ),
          block(
            title: "Lập trình ứng dụng cho các thiết bị di động",
            code: "2025-2026.1.TIN4403.006",
            students: "55 học viên",
            color: Colors.red,
          ),
          block(
            title: "Lập trình ứng dụng cho các thiết bị desktop",
            code: "2025-2026.1.TIN4403.005",
            students: "52 học viên",
            color: Colors.green,
          ),
          block(
            title: "Lập trình ứng dụng cho các thiết bị di động",
            code: "2025-2026.1.TIN4403.004",
            students: "50 học viên",
            color: Colors.blue,
          ),
          block(
            title: "Lập trình ứng dụng cho các thiết bị desktop",
            code: "2025-2026.1.TIN4403.003",
            students: "52 học viên",
            color: Colors.green,
          ),
        ],
      ),
    );
  }

  Widget block({
    required String title,
    required String code,
    required String students,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      height: 110,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  code,
                  style: const TextStyle(fontSize: 13, color: Colors.white70),
                ),
                Text(
                  students,
                  style: const TextStyle(fontSize: 13, color: Colors.white70),
                ),
              ],
            ),
          ),

          PopupMenuButton<String>(
            color: Colors.white,
            icon: const Icon(Icons.more_horiz, color: Colors.white),
            onSelected: (value) {
              debugPrint("Chọn: $value");
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'xem',
                  child: Text("Xem chi tiết"),
                ),
              ];
            },
          ),
        ],
      ),
    );
  }
}
