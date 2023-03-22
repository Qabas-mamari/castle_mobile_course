import 'package:firebase_database/firebase_database.dart';

import 'castle_model.dart';

class DatabaseHelper{

  static void createDataFirebaseRealtimeWithUniqueID(String mainNodeName,
      List<Map<String, dynamic>> fortList) {
    DatabaseReference dbRef = FirebaseDatabase.instance.ref(mainNodeName);
    if(fortList.isNotEmpty) {
      fortList.forEach((element) {
        dbRef.push().set(element)
            .then((value) => print("FortList data successfully saved!"))
            .catchError((error)=> print("Faild to write message : $error"));
      });
    }else{
      print("FortList is empty!");
    }
  }

  static void ReadDataFirebaseRealtime(Function(List<Castle>)castleListCallback ) {
    DatabaseReference dbRef = FirebaseDatabase.instance.ref();

    dbRef.child("Castle3").onValue.listen((castleDataJson) {
      if(castleDataJson.snapshot.exists){
        CastleData castleData;
        Castle castle;
        List<Castle> castleList = [];
        castleDataJson.snapshot.children.forEach((element) {
          castleData = CastleData.fromJson(element.value as Map);
          castle = Castle(element.key, castleData);
          castleList.add(castle);
        });
        castleListCallback(castleList);
      }else{
        print("The data snapshot does not exitst!");
      }
    });
  }
}