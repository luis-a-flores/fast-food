import 'package:flutter/material.dart';
import 'package:fast_food/utils/singleton.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Map> {
  Singleton singleton = Singleton();

  late GoogleMapController mapController;

  late LatLng _center = const LatLng(22.158697, -102.68745);

  void _onMapCreated(GoogleMapController controller){
    mapController = controller;
  }

  @override
  void initState(){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11
            ),
          )
        ],
      ),
    );
  }
}