import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PicOfTheDayScreen extends StatefulWidget {
  const PicOfTheDayScreen({Key? key}) : super(key: key);

  @override
  _PicOfTheDayScreenState createState() => _PicOfTheDayScreenState();
}

class _PicOfTheDayScreenState extends State<PicOfTheDayScreen> {
  late Future<PicOfTheDayData> futurePicOfTheDay;

  @override
  void initState() {
    super.initState();
    futurePicOfTheDay = fetchPicOfTheDay();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: screenSize.width,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          SingleChildScrollView(
            child: FutureBuilder<PicOfTheDayData>(
              future: futurePicOfTheDay,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData) {
                  return Center(
                    child: Text('No data available.'),
                  );
                } else {
                  return Container(
                    width: screenSize.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: 'picOfTheDayImage',
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FullScreenImage(
                                    imageUrl: snapshot.data!.imageUrl,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: screenSize.width,
                              height: screenSize.width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(snapshot.data!.imageUrl),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Picture Of the Day',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(height: 10),
                              Text(
                                snapshot.data!.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(height: 10),
                              Text(
                                snapshot.data!.description,
                                style: TextStyle(fontSize: 16),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(height: 60),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<PicOfTheDayData> fetchPicOfTheDay() async {
    const String apiKey = 'aKCPsASpnNuaWFu3nimYwrEbFaopliV273anXN6K';
    const String apiUrl = 'https://api.nasa.gov/planetary/apod?api_key=$apiKey';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        String imageUrl = data['hdurl'] ?? '';
        String title = data['title'] ?? 'No Title';
        String description = data['explanation'] ?? 'No Description';

        return PicOfTheDayData(
          imageUrl: imageUrl,
          title: title,
          description: description,
        );
      } else {
        throw Exception('Failed to load NASA data');
      }
    } catch (e) {
      print('Error fetching data: $e');
      rethrow;
    }
  }
}

class PicOfTheDayData {
  final String imageUrl;
  final String title;
  final String description;

  PicOfTheDayData({
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}

class FullScreenImage extends StatelessWidget {
  final String imageUrl;

  const FullScreenImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'picOfTheDayImage',
          child: PhotoViewGallery.builder(
            itemCount: 1,
            builder: (context, index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(imageUrl),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 2,
              );
            },
            scrollPhysics: BouncingScrollPhysics(),
            backgroundDecoration: BoxDecoration(
              color: Colors.black,
            ),
            pageController: PageController(),
          ),
        ),
      ),
    );
  }
}
