import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:castle_mobile_course/reuseableCode/MyRoundedImages.dart';

class MyImageList extends StatelessWidget {
  const MyImageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      //appBar: null,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: const [
                  Gap(20),
                  MyRoundedImages(imagePath: "2.jpg"),
                  Gap(20),
                  MyRoundedImages(imagePath: "3.jpg"),
                  Gap(20),
                  MyRoundedImages(imagePath: "4.jpg"),
                  Gap(20),
                  MyRoundedImages(imagePath: "5.jpg"),
                  Gap(20),


                ],
              ),
            )
          ],
        ),
      ),
      //bottomNavigationBar: ,
    );
  }
}
