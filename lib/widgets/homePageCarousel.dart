import 'package:flutter/material.dart';

import 'carouselElement.dart';

class HomePageCarousel extends StatefulWidget {


  HomePageCarousel({Key? key})
      : super(key: key);

  @override
  State<HomePageCarousel> createState() => _HomePageCarouselState();
}



class _HomePageCarouselState extends State<HomePageCarousel> {
  List<AssetImage> images = [AssetImage("./assets/images/loading_dummy.jpg")];
  List<String> titles = ["Loading"];

  @override
  Widget build(BuildContext context) {
    genHomePageCarousel();
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

  Future<void> genHomePageCarousel() async{
    await Future.delayed(Duration(seconds: 3));
    List<AssetImage> images = List.empty(growable: true);
    List<String> titles = ["Aurora over Canada", "Galaxies", "Dust and the Western Veil Nebula", "PDS 70: Disk, Planets, and Moons"];
    for(int i = 1; i < 5; i++){
    images.add(AssetImage("./assets/images/pic$i.jpg"));
  }
  setState(() {
    this.images = images;
    this.titles = titles;
  });
  
}
}

// import 'package:flutter/material.dart';
// import 'package:space_view/widgets/homePageCarousel.dart';

