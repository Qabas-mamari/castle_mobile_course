import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRowDats extends StatelessWidget {
  final String name, country;
  final int age;
  const AppRowDats({Key? key, required this.name, required this.country, required this.age,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  <Widget>[
        Text(
          name,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        Text(
          country,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        Text(
          age.toString(),
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        //const Image(image: AssetImage("assets/img/3.jpg")),
        // Image(image: "/assets/img/3.jpg"),
      ],
    );
  }
}
