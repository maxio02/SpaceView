import 'package:flutter/material.dart';
import '../pages/fullscreenArticlePage.dart';
import 'galleryElement.dart';

class VerticalGallery extends StatefulWidget {
  VerticalGallery({Key? key}) : super(key: key);

  @override
  State<VerticalGallery> createState() => _VerticalGalleryState();
}

class _VerticalGalleryState extends State<VerticalGallery> {
  List<AssetImage> images = [AssetImage("./assets/images/loading_dummy.jpg")];
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
    await Future.delayed(Duration(seconds: 1));
    if (!mounted) return;

    List<AssetImage> newImages = List.empty(growable: true);
    List<String> newTitles = [
      "Aurora over Canada",
      "Galaxies and a Comet",
      "Dust and the Western Veil Nebula",
      "PDS 70: Disk, Planets, and Moons"
    ];
    List<String> newDescriptions = [
      "What does this aurora look like to you? While braving the cold to watch the skies above northern Canada early one morning in 2013, a most unusual aurora appeared. The aurora definitely appeared to be shaped like something, but what? Two ghostly possibilities recorded by the astrophotographer were \"witch\" and \"goddess of dawn\", but please feel free to suggest your own Halloween-enhanced impressions.",
      "Galaxies abound in this sharp telescopic image recorded on October 12 in dark skies over June Lake, California. The celestial scene spans nearly 2 degrees within the boundaries of the well-trained northern constellation Canes Venatici. Prominent at the upper left 23.5 million light-years distant is big, beautiful spiral galaxy NGC 4258",
      "It's so big it is easy to miss. The entire Veil Nebula spans six times the diameter of the full moon, but is so dim you need binoculars to see it. The nebula was created about 15,000 years ago when a star in the constellation of the Swan (Cygnus) exploded. The spectacular explosion would have appeared brighter than even Venus for a week - but there is no known record of it. Pictured is the western edge of the still-expanding gas cloud. Notable gas filaments include the Witch's Broom Nebula on the upper left near the bright foreground star 52 Cygni, and Fleming's Triangular Wisp (formerly known as Pickering's Triangle) running diagonally up the image middle. What is rarely imaged -- but seen in the featured long exposure across many color bands -- is the reflecting brown dust that runs vertically up the image left, dust likely created in the cool atmospheres of massive stars.",
      "It's not the big ring that's attracting the most attention. Although the big planet-forming ring around the star PDS 70 is clearly imaged and itself quite interesting. It's also not the planet on the right, just inside the big disk, that’s being talked about the most."
    ];
    for (int i = 1; i < 5; i++) {
      newImages.add(AssetImage("./assets/images/pic$i.jpg"));
    }

    setState(() {
      images = newImages;
      titles = newTitles;
      descriptions = newDescriptions;
    });
  }
}