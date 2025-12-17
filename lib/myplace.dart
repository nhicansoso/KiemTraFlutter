import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyplacePage extends StatelessWidget {
  const MyplacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: myBody());
  }

  Widget myBody() {
    return Column(children: [block1(), block2(), block3(), block4()]);
  }

  Widget block1() {
    var src = "https://upload.wikimedia.org/wikipedia/commons/c/ca/Sahara.jpg";
    return Image.network(src, height: 300, width: 600, fit: BoxFit.cover);
  }

  Widget block2() {
    var title = "Sahara Desert";
    var subtitle = "North Africa";
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(subtitle, style: const TextStyle(color: Colors.grey)),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(Icons.star, color: Colors.orange),
              SizedBox(width: 4),
              Text("4.8"),
            ],
          ),
        ],
      ),
    );
  }

  Widget block3() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Icon(Icons.call, color: Colors.blue),
              Text("CALL", style: TextStyle(color: Colors.blue)),
            ],
          ),
          Column(
            children: [
              Icon(Icons.near_me, color: Colors.blue),
              Text("ROUTE", style: TextStyle(color: Colors.blue)),
            ],
          ),
          Column(
            children: [
              Icon(Icons.share, color: Colors.blue),
              Text("SHARE", style: TextStyle(color: Colors.blue)),
            ],
          ),
        ],
      ),
    );
  }

  Widget block4() {
    var content =
        "The Sahara Desert is the largest hot desert in the world, covering much of North Africa. "
        "It spans across 11 countries and is known for its vast sand dunes, rocky plateaus, and extreme climate. "
        "Daytime temperatures can exceed 50°C, while nights may become very cold. "
        "Despite its harsh conditions, the Sahara is home to unique wildlife, ancient cultures, and historic trade routes.";
    return Padding(padding: const EdgeInsets.all(20.0), child: Text(content));
  }
}
