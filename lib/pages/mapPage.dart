import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  double _gyroX = 0.0;
  double _gyroY = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Panorama(
        child: Image.asset('assets/images/starmap_2020_8k.png'),
        sensorControl: SensorControl.AbsoluteOrientation,
        sensitivity: 0,
        longitude: _gyroY,
        latitude: _gyroX,
        animSpeed: 0.00001,
      ),
    );
  }
}