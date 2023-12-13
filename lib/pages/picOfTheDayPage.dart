import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PicOfTheDayScreen extends StatelessWidget {
  const PicOfTheDayScreen({Key? key}) : super(key: key);

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
            child: Container(
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
                            builder: (context) => FullScreenImage(),
                          ),
                        );
                      },
                      child: Container(
                        width: screenSize.width,
                        height: screenSize.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/pic1.jpg'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  const Padding(
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
                          'Aurora over Canada',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'What does this aurora look like to you? While braving the cold to watch the skies above northern Canada early one morning in 2013, a most unusual aurora appeared. The aurora definitely appeared to be shaped like something, but what? Two ghostly possibilities recorded by the astrophotographer were "witch" and "goddess of dawn", but please feel free to suggest your own Halloween-enhanced impressions.',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 60),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FullScreenImage extends StatelessWidget {
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
                imageProvider: AssetImage('assets/images/pic1.jpg'),
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
