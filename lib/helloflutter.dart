import 'package:flutter/material.dart';

class Helloflutter extends StatelessWidget {
  const Helloflutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: myBody());
  }

  Widget myBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: [
        Center(
          child: Text(
            'Hello Flutter ',
            style: TextStyle(
              fontSize: 30,
              color: const Color.fromARGB(255, 210, 31, 162),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Center(
          child: Icon(
            Icons.heart_broken,
            size: 200,
            color: const Color.fromARGB(255, 220, 36, 12),
          ),
        ),
        Center(child: Text("Chào mừng bạn đến với flutter!!")),
      ],
    );
  }
}
