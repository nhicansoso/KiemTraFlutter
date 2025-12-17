import 'package:flutter/material.dart';

class MylayoutPage extends StatelessWidget {
  const MylayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              block1(),
              const SizedBox(height: 10),
              block2(),
              const SizedBox(height: 20),
              block3(),
              const SizedBox(height: 25),
              block4(),
            ],
          ),
        ),
      ),
    );
  }

  Widget block1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none, color: Colors.black87),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings, color: Colors.black87),
        ),
      ],
    );
  }

  Widget block2() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome,",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        SizedBox(height: 4),
        Text("Charlie", style: TextStyle(fontSize: 24, color: Colors.black87)),
      ],
    );
  }

  Widget block3() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        prefixIcon: const Icon(Icons.search),
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
    );
  }

  Widget block4() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Saved Places",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                imageCard('assets/images/anh1.jpg'),
                imageCard('assets/images/anh2.jpg'),
                imageCard('assets/images/anh3.jpg'),
                imageCard('assets/images/anh4.jpg'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget imageCard(String path) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(path, fit: BoxFit.cover),
    );
  }
}

void main(List<String> args) {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: MylayoutPage()),
  );
}
