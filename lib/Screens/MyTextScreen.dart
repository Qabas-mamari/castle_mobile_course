import 'package:castle_mobile_course/Data/DatabaseHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:castle_mobile_course/reuseableCode/AppFortDecoration.dart';
import 'package:castle_mobile_course/reuseableCode/AppRowData.dart';
import 'package:castle_mobile_course/reuseableCode/AppStyles.dart';
import 'package:castle_mobile_course/Data/app_info_list.dart.txt';

import '../Data/castle_model.dart';

class MyTextScreen extends StatefulWidget {
  const MyTextScreen({Key? key}) : super(key: key);

  @override
  State<MyTextScreen> createState() => _MyTextScreenState();
}

class _MyTextScreenState extends State<MyTextScreen> {
  List<Castle> castleList = [];

  @override
  void initState(){
    super.initState();
    DatabaseHelper.ReadDataFirebaseRealtime((castle) {
      setState(() {
        this.castleList = castle;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("SQU !")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: ListView(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Name',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                      'Country',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                      'Age',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    //const Image(image: AssetImage("assets/img/3.jpg")),
                    // Image(image: "/assets/img/3.jpg"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '====',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      '======',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      '===',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    //const Image(image: AssetImage("assets/img/3.jpg")),
                    // Image(image: "/assets/img/3.jpg"),
                  ],
                ),
                const Gap(10),
                const AppRowDats(name: "Qabas", country: "Oman", age: 25),
                const AppRowDats(name: "Hamed", country: "KSA", age: 23),
                const AppRowDats(name: "Ali", country: "Qater", age: 18),
                const AppRowDats(name: "Salim", country: "UAE", age: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '====',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      '======',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      '===',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    //const Image(image: AssetImage("assets/img/3.jpg")),
                    // Image(image: "/assets/img/3.jpg"),
                  ],
                ),
                const Gap(80),
                const Text("Castle",
                    style: TextStyle(
                        color: Colors.brown,
                        fontSize: 36,
                        fontWeight: FontWeight.bold)),
                 SingleChildScrollView(
                   scrollDirection: Axis.horizontal,
                  child: Row(
                    children:[
                      for(int i=0; i<castleList.length; i++)
                          AppFortDecoration(castle: castleList[i])
                    ],
                    //  fortList.map((castle)=>AppFortDecoration(fort: castle,)).toList(),
                  )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
