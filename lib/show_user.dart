import 'package:flutter/material.dart';
import 'package:kiemtragiuaky/model/user.dart';

class ShowUser extends StatelessWidget {
  final MyUser user;

  const ShowUser({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thông tin người dùng"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(user.image),
              ),
            ),
            const SizedBox(height: 20),

            Text(
              "Họ tên: ${user.firstName} ${user.lastName}",
              style: const TextStyle(fontSize: 18),
            ),
            Text("Email: ${user.email}", style: const TextStyle(fontSize: 18)),
            Text("Tuổi: ${user.age}", style: const TextStyle(fontSize: 18)),
            Text(
              "Giới tính: ${user.gender}",
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "Thành phố: ${user.address.city}",
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "Quốc gia: ${user.address.country}",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
