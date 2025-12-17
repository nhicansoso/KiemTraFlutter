import 'package:flutter/material.dart';

import 'package:kiemtragiuaky/color_change.dart';
import 'package:kiemtragiuaky/dangky.dart';
import 'package:kiemtragiuaky/dangnhapAPI.dart';
import 'package:kiemtragiuaky/demso.dart';
import 'package:kiemtragiuaky/classroom.dart';
import 'package:kiemtragiuaky/myplace.dart';
import 'package:kiemtragiuaky/demthoigian.dart';
import 'package:kiemtragiuaky/helloflutter.dart';
import 'package:kiemtragiuaky/mylayout.dart';
import 'package:kiemtragiuaky/hotel_card.dart';
import 'package:kiemtragiuaky/dangnhap.dart';
import 'package:kiemtragiuaky/news_list_screen.dart';
import 'package:kiemtragiuaky/news_detail_screen.dart';
import 'package:kiemtragiuaky/my_products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: const TongHopBaiTap(),

      routes: {'/detail': (context) => const NewsDetailScreen()},
    );
  }
}

class TongHopBaiTap extends StatefulWidget {
  const TongHopBaiTap({super.key});

  @override
  State<TongHopBaiTap> createState() => _TongHopBaiTapState();
}

class _TongHopBaiTapState extends State<TongHopBaiTap> {
  int selectedIndex = 0;

  final List<String> danhSachBaiTap = [
    'Hello Flutter',
    'Bài tập layout',
    'Danh sách lớp học',
    'Địa điểm du lịch',
    'Đổi màu ngẫu nhiên',
    'Ứng dụng đếm số',
    'Đếm thời gian',
    'Form Đăng nhập API',
    'Form Đăng ký',
    'Form Đăng nhập',
    'Danh sách khách sạn',
    'Danh sách sản phẩm',
    'Danh sách tin tức',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Tổng hợp bài tập',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2196F3), Color(0xFF21CBF3)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),

      drawer: Drawer(
        child: ListView.builder(
          itemCount: danhSachBaiTap.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(danhSachBaiTap[index]),
              selected: selectedIndex == index,
              onTap: () {
                setState(() => selectedIndex = index);
                Navigator.pop(context);
              },
            );
          },
        ),
      ),

      body: getNoiDungBaiTap(selectedIndex),
    );
  }

  Widget getNoiDungBaiTap(int index) {
    switch (index) {
      case 0:
        return const Helloflutter();
      case 1:
        return const MylayoutPage();
      case 2:
        return const ClassroomPage();
      case 3:
        return const MyplacePage();
      case 4:
        return const ColorDisplayPage();
      case 5:
        return const DemsoPage();
      case 6:
        return const Demthoigian();
      case 7:
        return const LoginAPIPage();
      case 8:
        return const RegisterPage();
      case 9:
        return const LoginForm();
      case 10:
        return const HotelListScreen();
      case 11:
        return const MyProductsPage();
      case 12:
        return const NewsListScreen();
      default:
        return const Center(child: Text('Chọn bài tập'));
    }
  }
}
