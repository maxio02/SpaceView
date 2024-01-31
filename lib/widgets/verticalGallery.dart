import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';
import 'package:space_view/pages/videoPage.dart';
import 'package:space_view/widgets/noInternetError.dart';
import 'dart:convert';
import 'verticalGalleryElement.dart';

import 'package:space_view/managers/audioManager.dart';
import 'package:provider/provider.dart';

class VerticalGallery extends StatefulWidget {
  VerticalGallery({Key? key}) : super(key: key);

  @override
  State<VerticalGallery> createState() => VerticalGalleryState();
}

class VerticalGalleryState extends State<VerticalGallery> {
  late Future<List<VerticalGalleryElement>> futureGalleryElements;
  static const int batchSize = 15;
  static const String videoUrl =
      'https://images-assets.nasa.gov/video/20190530-SPITZRf-0001-Stars%20of%20Cephus/20190530-SPITZRf-0001-Stars%20of%20Cephus~orig.mp4';
  static const String videoTitle = 'Stars of Cepheus';

  @override
  void initState() {
    super.initState();
    futureGalleryElements = genVerticalGallery();
  }

  @override
  Widget build(BuildContext context) {
    final AudioManager audioManager = Provider.of<AudioManager>(context);

    var screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height,
      child: FutureBuilder<List<VerticalGalleryElement>>(
        future: genVerticalGallery(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildShimmerEffect();
          } else if (snapshot.hasError) {
            // Display error message and icon
            return NoInternetError();
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return NoInternetError();
          } else {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: TextButton(
                    onPressed: () {
                      audioManager.playClickSound();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoScreen(
                            videoLink: videoUrl,
                            videoTitle: videoTitle,
                          ),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context)
                          .colorScheme
                          .secondary, // Button text color
                      backgroundColor: Theme.of(context)
                          .primaryColor, // Button background color
                      textStyle: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    child: Text("Watch a Video"),
                  ),
                ),

                // Gallery
                Flexible(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final galleryElement = VerticalGalleryElement(
                        imageUrl: snapshot.data![index].imageUrl,
                        title: snapshot.data![index].title,
                        description: snapshot.data![index].description,
                      );
                      return galleryElement;
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Future<List<VerticalGalleryElement>> genVerticalGallery() async {
    const String apiKey = 'aKCPsASpnNuaWFu3nimYwrEbFaopliV273anXN6K';
    const String apiUrl =
        'https://api.nasa.gov/planetary/apod?api_key=$apiKey&count=$batchSize';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);

        List<VerticalGalleryElement> newGalleryItems = [];

        for (var item in data) {
          String imageUrl = item['hdurl'] ?? '';
          String title = item['title'] ?? 'No Title';
          String description = item['explanation'] ?? 'No Description';

          newGalleryItems.add(VerticalGalleryElement(
            imageUrl: imageUrl,
            title: title,
            description: description,
          ));
        }

        return newGalleryItems;
      } else {
        throw Exception('Failed to load NASA data');
      }
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }

Widget _buildShimmerEffect() {
  return Column(
    children: [
      Flexible(
        child: Container(
          margin: EdgeInsets.only(top: 73),
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 21, vertical: 16),
                width: 362,
                height: 510,
                child: Shimmer.fromColors(
                  baseColor: Theme.of(context).primaryColor,
                  highlightColor:
                      Theme.of(context).navigationBarTheme.backgroundColor!
                          .withOpacity(1),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(26),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    ],
  );
}
}