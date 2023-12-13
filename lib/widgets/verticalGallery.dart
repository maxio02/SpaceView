import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../pages/fullscreenArticlePage.dart';
import 'galleryElement.dart';

class VerticalGallery extends StatefulWidget {
  VerticalGallery({Key? key}) : super(key: key);

  @override
  State<VerticalGallery> createState() => _VerticalGalleryState();
}

class _VerticalGalleryState extends State<VerticalGallery> {
  List<ImageProvider> images = [AssetImage("./assets/images/loading_dummy.jpg")];
  List<String> titles = [" "];
  List<String> descriptions = [" "];

  @override
  void initState() {
    super.initState();
    genVerticalGallery();
  }

  @override
Widget build(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    height: screenSize.height,
    child: ListView.builder(
      itemCount: images.length,
      scrollDirection: Axis.vertical,
      prototypeItem: GalleryElement(image: images.first, title: titles.first, description: descriptions.first),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FullscreenArticleScreen(
                image: images[index],
                title: titles[index],
                description: descriptions[index],
              )),
            );
          },
          child: GalleryElement(image: images[index], title: titles[index], description: descriptions[index]),
        );
      },
    ),
  );
}

  Future<void> genVerticalGallery() async {
  const String apiKey = '8g6pdCUfYtcLjyq1eJt3KI30xUccOMLhpK4KPai1';
  const String apiUrl = 'https://api.nasa.gov/planetary/apod?api_key=$apiKey&count=10';

  try {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);

      List<ImageProvider> newImages = [];
      List<String> newTitles = [];
      List<String> newDescriptions = [];

      for (var item in data) {
        newImages.add(NetworkImage(item['hdurl']));
        newTitles.add(item['title']);
        newDescriptions.add(item['explanation']);
      }

      if (!mounted) return;
      setState(() {
        images = newImages;
        titles = newTitles;
        descriptions = newDescriptions;
      });
    } else {
      throw Exception('Failed to load NASA data');
    }
  } catch (e) {
    print('Error fetching data: $e');
    // Handle error or show a message
  }
}
}
