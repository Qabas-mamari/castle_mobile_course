import 'package:castle_mobile_course/Data/castle_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapScreen extends StatelessWidget {
  final Castle castle;
  const MapScreen({Key? key, required this.castle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: const Text("Castle Location"),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(castle.castleData!.latitude!, castle.castleData!.longitude!),
          zoom: 5.0,
        ),
        markers: {
          Marker(
            markerId: const MarkerId("castleMarker"),
            position: LatLng(castle.castleData!.latitude!, castle.castleData!.latitude!),
            infoWindow: InfoWindow(title: castle.castleData!.name!),
          )
        },
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    ));
  }
}
