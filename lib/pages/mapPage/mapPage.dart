import 'package:flutter/material.dart';
import 'package:space_view/functions/panorama.dart';
import 'package:space_view/pages/fullscreenArticlePage.dart';
import 'constellation_data.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

Widget hotspotButton({String? text, IconData? icon, VoidCallback? onPressed}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(CircleBorder()),
          backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(96, 255, 255, 255)),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
        child: Icon(icon),
        onPressed: onPressed,
      ),
      text != null
          ? Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Center(child: Text(text)),
            )
          : Container(),
    ],
  );
}

class _MapScreenState extends State<MapScreen> {
  double _gyroX = 0.0;
  double _gyroY = 0.0;
  bool isLoading = true;
  

  @override
  void initState() {
    super.initState();
    
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      // Show loading indicator
      return Center(child: CircularProgressIndicator());
    } else {
      List<Hotspot> constellations = constellationInfos.map((constellation) {
        return Hotspot(
          name: constellation.name,
          latitude: constellation.latitude,
          longitude: constellation.longitude,
          width: 100,
          height: 80,
          widget: hotspotButton(
            text: constellation.name,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullscreenArticleScreen(
                    imageUrl: constellation.imageUrl,
                    title: '${constellation.name} constellation',
                    description: constellation.description,
                  ),
                ),
              );
            },
          ),
        );
      }).toList();

      return Container(
        child: Panorama(
          sensorControl: SensorControl.AbsoluteOrientation,
          sensitivity: 0,
          longitude: _gyroY,
          latitude: _gyroX,
          animSpeed: 0.00001,
          child: Image.asset('assets/images/starmap_2020_8k.jpg'),
          hotspots: constellations,
        ),
      );
    }
  }
}
