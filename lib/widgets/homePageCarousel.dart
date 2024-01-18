import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';
import 'package:space_view/widgets/noInternetError.dart';
import 'package:space_view/widgets/verticalGalleryElement.dart';
import 'dart:convert';
import '../pages/fullscreenArticlePage.dart';
import 'carouselElement.dart';

import 'package:space_view/managers/audioManager.dart';
import 'package:provider/provider.dart';

class HomePageCarousel extends StatefulWidget {
  const HomePageCarousel({super.key});

  @override
  State<HomePageCarousel> createState() => HomePageCarouselState();
}

class HomePageCarouselState extends State<HomePageCarousel> {
  late Future<List<CarouselGalleryElement>> futureCarouselItems;
  static const int batchSize = 5;

  @override
  void initState() {
    super.initState();
    futureCarouselItems = genHomePageCarousel();
  }

  @override
  Widget build(BuildContext context) {
    final AudioManager audioManager = Provider.of<AudioManager>(context);
    return Container(
      height: 300,
      child: FutureBuilder<List<CarouselGalleryElement>>(
        future: futureCarouselItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
              return _buildShimmerEffect();
          } else if (snapshot.hasError) {
          // Display error message and icon
          return NoInternetError();
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No data available.'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final galleryElement = CarouselGalleryElement(
                        imageUrl: snapshot.data![index].imageUrl,
                        title: snapshot.data![index].title,
                        description: snapshot.data![index].description,
                      );
                return galleryElement;
                 },
            );
          }
        },
      ),
    );
  }

  Future<List<CarouselGalleryElement>> genHomePageCarousel() async {
    const String apiKey = 'aKCPsASpnNuaWFu3nimYwrEbFaopliV273anXN6K';
    const String apiUrl =
        'https://api.nasa.gov/planetary/apod?api_key=$apiKey&count=$batchSize';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);

        List<CarouselGalleryElement> newCarouselItems = [];

        for (var item in data) {
          String imageUrl = item['hdurl'] ?? '';
          String title = item['title'] ?? 'No Title';
          String description = item['explanation'] ?? 'No Description';

          newCarouselItems.add(CarouselGalleryElement(
            imageUrl: imageUrl,
            title: title,
            description: description,
          ));
        }

        return newCarouselItems;
      } else {
        throw Exception('Failed to load NASA data');
      }
    } catch (e) {
      print('Error fetching data: $e');
      rethrow;
    }
  }

  Widget _buildShimmerEffect() {
  return ListView.builder(
    itemCount: 5,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 22),
        width: 174,
        child: Shimmer.fromColors(
          baseColor: Theme.of(context).primaryColor,
          highlightColor: Theme.of(context).navigationBarTheme.backgroundColor!.withOpacity(1),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(26),
            ),
          ),
        ),
      );
    },
  );
}
}