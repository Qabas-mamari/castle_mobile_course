import 'package:castle_mobile_course/Data/castle_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'AppStyles.dart';
import 'AppStyles.dart';

class AppFortDecoration extends StatelessWidget {
  final Castle castle;

  const AppFortDecoration({Key? key, required this.castle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 360,
        width: 0.75 * MediaQuery.of(context).size.width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.brown[300],),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.yellow,

                    image: DecorationImage(
                      fit: BoxFit.cover,
                        image: AssetImage("assets/img/${fort['image']}"),
                    ),
                  border: Border.all(width: 5, color: Colors.brown.shade200),
                  boxShadow:   [
                    BoxShadow(color: Colors.brown.shade800, blurRadius: 10, spreadRadius: 6.5, blurStyle: BlurStyle.normal)
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(

                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.brown[200],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text("Name", style: AppStyles.textStyle1,),
                          Text("Place", style: AppStyles.textStyle1,),
                          Text("Year", style: AppStyles.textStyle1,),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children:  [
                          Text(fort["name"], style: AppStyles.textStyle1,),
                          Text(fort["place"], style: AppStyles.textStyle1,),
                          Text(fort["established"].toString(), style: AppStyles.textStyle1,),
                        ],),
                    ],
                  ),

                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
