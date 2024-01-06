import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:space_view/pages/videoPage.dart';
import 'dart:convert';
import '../pages/fullscreenArticlePage.dart';
import 'galleryElement.dart';

class VerticalGallery extends StatefulWidget {
  VerticalGallery({Key? key}) : super(key: key);

  @override
  State<VerticalGallery> createState() => _VerticalGalleryState();
}

class _VerticalGalleryState extends State<VerticalGallery> {
  late Future<List<GalleryItem>> futureGalleryItems;
  static const int batchSize = 15;
  static const String videoUrl =
      'https://images-assets.nasa.gov/video/20190530-SPITZRf-0001-Stars%20of%20Cephus/20190530-SPITZRf-0001-Stars%20of%20Cephus~orig.mp4';
  static const String videoTitle = 'Stars of Cepheus';

  @override
  void initState() {
    super.initState();
    futureGalleryItems = genVerticalGallery();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height,
      child: FutureBuilder<List<GalleryItem>>(
        future: genVerticalGallery(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No data available.'),
            );
          } else {
            return Column(
              children: [
                // Navigate to video screen
                Container(
                  margin:
                      EdgeInsets.only(top: 25), // Adjust top margin as needed
                  child: TextButton(
                    onPressed: () {
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
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FullscreenArticleScreen(
                                image: snapshot.data![index].image,
                                imageUrl: snapshot.data![index].imageUrl,
                                title: snapshot.data![index].title,
                                description: snapshot.data![index].description,
                              ),
                            ),
                          );
                        },
                        child: GalleryElement(
                          image: snapshot.data![index].image,
                          title: snapshot.data![index].title,
                          description: snapshot.data![index].description,
                        ),
                      );
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

  Future<List<GalleryItem>> genVerticalGallery() async {
    const String apiKey = 'aKCPsASpnNuaWFu3nimYwrEbFaopliV273anXN6K';
    const String apiUrl =
        'https://api.nasa.gov/planetary/apod?api_key=$apiKey&count=$batchSize';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);

        List<GalleryItem> newGalleryItems = [];

        for (var item in data) {
          String imageUrl = item['hdurl'] ?? '';
          String title = item['title'] ?? 'No Title';
          String description = item['explanation'] ?? 'No Description';

          newGalleryItems.add(GalleryItem(
            image: NetworkImage(imageUrl),
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
      rethrow; // Re-throw the error to be caught by the FutureBuilder
    }
  }
}

class GalleryItem {
  final ImageProvider image;
  final String imageUrl;
  final String title;
  final String description;

  GalleryItem({
    required this.image,
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}
