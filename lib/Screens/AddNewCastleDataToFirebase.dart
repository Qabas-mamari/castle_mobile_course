import 'package:castle_mobile_course/Data/DatabaseHelper.dart';
import 'package:castle_mobile_course/Data/castle_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../main.dart';
import '../reuseableCode/Helper.dart';

class AddNewCastleDataToFirebase extends StatelessWidget{
  final Castle? castle;
  final bool isUpdate;
  final void Function(Castle castle, bool isUpdate) onUpdateCastle;

//comment
  final nameController = TextEditingController();
  final imagePathController = TextEditingController();
  final placeController = TextEditingController();
  final yearEstablishedController = TextEditingController();
  final ticketPriceController = TextEditingController();

  final GlobalKey<ScaffoldMessengerState> _scafoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  AddNewCastleDataToFirebase({super.key,
    this.castle,
    this.isUpdate = false,
    required this.onUpdateCastle});

  @override
  Widget build(BuildContext context) {
    if(isUpdate && castle != null){
      nameController.text = castle!.castleData!.name ?? "";
      imagePathController.text = castle!.castleData!.image ?? "";
      placeController.text = castle!.castleData!.place ?? "";
      yearEstablishedController.text = castle!.castleData!.yearEstablished.toString() ?? "";
      ticketPriceController.text = castle!.castleData!.toString() ?? "" ;

    }
    return MaterialApp(
      title: 'Flutter Firebase Create/Update Demo',
      home: ScaffoldMessenger(
        key: _scafoldMessengerKey,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Firebase Create/Update Demo'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                  ),
                  TextField(
                    controller: imagePathController,
                    decoration: const InputDecoration(labelText: 'Image Path'),
                  ),
                  TextField(
                    controller: placeController,
                    decoration: const InputDecoration(labelText: 'Place'),
                  ),
                  TextField(
                    controller: yearEstablishedController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Established'),
                  ),
                  TextField(
                    controller: ticketPriceController,
                    keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                    decoration:
                    const InputDecoration(labelText: 'Ticket Price'),
                  ),
                  ElevatedButton(
                    child: const Text('Save'),
                    onPressed: () {
                      CastleData castleData = CastleData(
                        imagePathController.text,
                        nameController.text,
                        placeController.text,
                        int.parse(yearEstablishedController.text),
                        double.parse(ticketPriceController.text),
                      );
                      if (isUpdate && castle != null) {
                        DatabaseHelper.updateCastleData(
                            castle!.key!, castleData)
                            .then((_) async => {
                        await Helper.showNotification(
                        localNotificationPlugin: flutterLocalNotificationsPlugin,
                        title: 'Success',
                        body: 'Castle updated successfully!',
                        id: 1,
                        ),
                          _scafoldMessengerKey.currentState
                              ?.showSnackBar(const SnackBar(
                            content: Text(
                              "Data updated successfully",
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: Colors.green,
                          )
                          )
                        })
                            .catchError((error) async {
                          await Helper.showNotification(
                            localNotificationPlugin: flutterLocalNotificationsPlugin,
                            title: 'Error',
                            body: 'Error updating a castle: ${error.toString()}',
                            id: 2,
                          );
                          _scafoldMessengerKey.currentState?.showSnackBar(
                            SnackBar(
                              content: Text(
                                'Failed to update data: $error',
                                textAlign: TextAlign.center,
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        });
                      } else {
                        DatabaseHelper.savedDataItem(castleData).then((_) async {
                          await Helper.showNotification(
                            localNotificationPlugin: flutterLocalNotificationsPlugin,
                            title: 'Success',
                            body: 'Castle saved successfully!',
                            id: 1,
                          );
                          _scafoldMessengerKey.currentState?.showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Data saved successfully',
                                textAlign: TextAlign.center,
                              ),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }).catchError((error) async {
                          await Helper.showNotification(
                            localNotificationPlugin: flutterLocalNotificationsPlugin,
                            title: 'Error',
                            body: 'Error saving a castle: ${error.toString()}',
                            id: 2,
                          );
                          _scafoldMessengerKey.currentState?.showSnackBar(
                            SnackBar(
                              content: Text(
                                'Failed to save data: $error',
                                textAlign: TextAlign.center,
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}