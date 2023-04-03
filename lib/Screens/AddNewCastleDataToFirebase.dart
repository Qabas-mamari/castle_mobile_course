import 'package:castle_mobile_course/Data/DatabaseHelper.dart';
import 'package:castle_mobile_course/Data/castle_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddNewCastleDataToFirebase extends StatelessWidget{
  final nameController = TextEditingController();
  final imagePathController = TextEditingController();
  final placeController = TextEditingController();
  final yearEstablishedController = TextEditingController();
  final ticketPriceController = TextEditingController();

  final GlobalKey<ScaffoldMessengerState> _scafoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  AddNewCastleDataToFirebase({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Create Demo',
      home: ScaffoldMessenger(
        key: _scafoldMessengerKey,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Flutter Firebase Create Demo"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                  ),
                  TextField(
                    controller: imagePathController,
                    decoration: const InputDecoration(labelText: "Image Path"),
                  ),
                  TextField(
                    controller: placeController,
                    decoration: const InputDecoration(labelText: "Place"),
                  ),
                  TextField(
                    controller: yearEstablishedController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Established'),
                  ),
                  TextField(
                    controller: ticketPriceController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(labelText: 'Ticket Price'),
                  ),
                  ElevatedButton(
                      child: const Text("Save"),
                    onPressed: (){
                        CastleData castleData = CastleData(
                          imagePathController.text,
                          nameController.text,
                          placeController.text,
                          int.parse(yearEstablishedController.text),
                          double.parse(ticketPriceController.text)
                        );
                        DatabaseHelper.savedDataItem(castleData).then((_){
                          _scafoldMessengerKey.currentState?.showSnackBar(
                            const SnackBar(
                                content: Text("Data saved successfully", textAlign: TextAlign.center,),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }).catchError((error){
                          _scafoldMessengerKey.currentState?.showSnackBar(
                            SnackBar(
                                content: Text('Failed to save data: $error', textAlign: TextAlign.center,),
                              backgroundColor: Colors.red,
                            ),
                          );
                        });
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}