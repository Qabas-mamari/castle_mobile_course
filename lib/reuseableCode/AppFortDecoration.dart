import 'package:castle_mobile_course/Data/castle_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'AppStyles.dart';


class AppFortDecoration extends StatelessWidget {
  final Castle castle;
  final Function (Castle, bool) onUpdateCastle;
  final Function(String key) onDelete;
  final Function(Castle) onShowMap;

  const AppFortDecoration({Key? key, required this.castle, required this.onUpdateCastle, required this.onDelete, required this.onShowMap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 410,
        width: 0.75 * MediaQuery.of(context).size.width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.brown[300],),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: 210,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.yellow,

                    image: DecorationImage(
                      fit: BoxFit.cover,
                        image: AssetImage("assets/img/${castle.castleData!.image.toString()}"),
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
                height: 150,
                width: 0.75 * MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.brown[200],
                ),
                child: Stack(
                  children: [
                    Padding(
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
                              Text(castle.castleData!.name.toString(), style: AppStyles.textStyle1,),
                              Text(castle.castleData!.place.toString(), style: AppStyles.textStyle1,),
                              Text(castle.castleData!.yearEstablished.toString(), style: AppStyles.textStyle1,),
                            ],),
                        ],
                      ),

                    ),
                    Positioned(
                        bottom: 10,
                        left: 130,
                        child: IconButton(
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.blue,
                          ),
                          onPressed: (){
                            onUpdateCastle(castle, true);
                          },
                        )
                    ),
                    Positioned(
                      bottom: 10,
                      left: 100,
                      child: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: ()=> onDelete(castle.key!),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 150,
                      child: IconButton(
                        icon: const Icon(
                          Icons.map,
                          color: Colors.purple,
                        ),
                        onPressed: ()=> onShowMap(castle),
                      ),
                    ),
                  ],
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
