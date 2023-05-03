import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'castle_model.dart';

class DatabaseHelper{

  static void createDataFirebaseRealtimeWithUniqueID(
      String mainNodeName, List<Map<String, dynamic>> fortList) {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref(mainNodeName);
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

  static Future<void> updateCastleData(String key, CastleData castleData) async {
    DatabaseReference df = FirebaseDatabase.instance.ref();
    await df.child("Castle3").child(key).update(castleData.toJson());
  }

static Future<void> deleteCastle(String key) async{
    DatabaseReference df = FirebaseDatabase.instance.ref();
    await df.child("Castle3").child(key).remove();
  }

  static Future<void> sendSMS(String phoneNumber, String message, BuildContext context) async{
    String smsUrl = "sms: $phoneNumber?body=$message";

    if(await canLaunch(smsUrl)){
      await launch(smsUrl);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(
          "Faild to send SMS. Please check your device's capablities"
        ),
        backgroundColor: Colors.red,
        )
      );
    }
  }
}