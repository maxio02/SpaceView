import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  double _gyroX = 0.0;
  double _gyroY = 0.0;
  double _gyroZ = 0.0;

  String _gpsPosition = "Unknown";

  @override
  void initState() {
    super.initState();
    _initGyro();
    _initGPS();
  }

  void _initGyro() {
    gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        _gyroX = event.x;
        _gyroY = event.y;
        _gyroZ = event.z;
      });
    });
  }

  void _initGPS() async {
  try {
    Position position = await _determinePosition();
    setState(() {
      _gpsPosition = "${position.latitude}, ${position.longitude}";
    });
  } catch (e) {
    setState(() {
      _gpsPosition = "Error: ${e.toString()}";
    });
  }
}

  Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  } 
  return await Geolocator.getCurrentPosition();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 300),
            Center(child: Text('Map Screen')),
            Text('Gyro X: ${_gyroX.toStringAsFixed(2)}'),
            Text('Gyro Y: ${_gyroY.toStringAsFixed(2)}'),
            Text('Gyro Z: ${_gyroZ.toStringAsFixed(2)}'),
            Text('GPS Position: $_gpsPosition'),
          ],
        ),
      ),
    );
  }
}