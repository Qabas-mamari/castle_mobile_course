import 'package:flutter/cupertino.dart';

class MyRoundedImages extends StatelessWidget {
  final String imagePath;
  const MyRoundedImages({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration:  BoxDecoration(borderRadius: BorderRadius.circular(20),
          image: DecorationImage(fit: BoxFit.cover,image: AssetImage("assets/img/$imagePath"))
      ),
    );
  }
}
