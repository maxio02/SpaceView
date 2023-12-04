import 'package:flutter/material.dart';
import 'carouselElement.dart';

class HomePageCarousel extends StatefulWidget {
  HomePageCarousel({Key? key}) : super(key: key);

  @override
  State<HomePageCarousel> createState() => _HomePageCarouselState();
}

class _HomePageCarouselState extends State<HomePageCarousel> {
  List<AssetImage> images = [AssetImage("./assets/images/loading_dummy.jpg")];
  List<String> titles = ["Loading"];

  @override
  void initState() {
    super.initState();
    genHomePageCarousel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: images.length,
        scrollDirection: Axis.horizontal,
        prototypeItem: CarouselElement(image: images.first, title: titles.first),
        itemBuilder: (context, index) {
          return CarouselElement(image: images[index], title: titles[index]);
        },
      ),
    );
  }

  Future<void> genHomePageCarousel() async {
    await Future.delayed(Duration(seconds: 3));
    if (!mounted) return;

    List<AssetImage> newImages = List.empty(growable: true);
    List<String> newTitles = [
      "Aurora over Canada",
      "Galaxies and a Comet",
      "Dust and the Western Veil Nebula",
      "PDS 70: Disk, Planets, and Moons"
    ];
    for (int i = 1; i < 5; i++) {
      newImages.add(AssetImage("./assets/images/pic$i.jpg"));
    }

    setState(() {
      images = newImages;
      titles = newTitles;
    });
  }
}