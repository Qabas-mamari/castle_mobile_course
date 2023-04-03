import 'package:firebase_database/firebase_database.dart';
import 'castle_model.dart';

class DatabaseHelper{

  static void createDataFirebaseRealtimeWithUniqueID(
      String mainNodeName, List<Map<String, dynamic>> fortList) {
    DatabaseReference databaseReference =
    FirebaseDatabase.instance.ref(mainNodeName);
    if (fortList.isNotEmpty) {
      fortList.forEach((element) {
        databaseReference.push().set(element)
            .then((value) => print("FortList data successfully saved!"))
            .catchError((error) => print("Failed to write message: $error"));
      });
    } else {
      print("Fortlist is empty!");
    }
  }

  //static --> no need to create objects
  //flutter run --> to run the flutter project
  //
  static void ReadDataFirebaseRealtime(
      Function(List<Castle>) castleListCallback) {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    databaseReference.child("Castle3").onValue.listen((castleDataJson) {
      if (castleDataJson.snapshot.exists) {
        CastleData castleData;
        Castle castle;
        List<Castle> castleList = [];
        castleDataJson.snapshot.children.forEach((element) {
          //print("Element Key: ${element.key}");
          //print("Element: ${element.value}");
          castleData = CastleData.fromJson(element.value as Map);
          castle = Castle(element.key, castleData);
          castleList.add(castle);
        });
        castleListCallback(castleList);
      } else {
        print("The data snapshot does not exist!");
      }
    });
  }

  static Future<void> savedDataItem(CastleData castleData){
    DatabaseReference df = FirebaseDatabase.instance.ref();
    return df.child("Castle3").push().set(castleData.toJson())
        .then((value) => print("Castle data saved successfully"))
        .catchError((error)=> print("Failed to save Castle data : $error"));
  }


}