import 'package:flutter/material.dart';
import 'package:space_view/theme/themeConstants.dart';
import 'package:flutter/services.dart';
class SpaceViewBottomNavBar extends StatefulWidget {
  final int initialSelectedIndex;
  /*TODO 
  Figure out how to send the user to diffrent screens
    Possible solutins:
    -property Called onTap that can get a reference to a function
    -https://codewithandrea.com/articles/multiple-navigators-bottom-navigation-bar/
    -better solution: use package called Cupertino, also has some nice IOS widgets
    -cupertino is used for IOS devices and Material Design(what we use now) mainly for android
    -after a while I now think we should switch to cupertino entirely
  Maybe try to use SF Symbols as they are already imported to the project, would have problems
  with the EULA of how they can be used

  Proper Colors From the theme constants file
  */
  
  SpaceViewBottomNavBar({required this.initialSelectedIndex});

  @override
  State<SpaceViewBottomNavBar> createState() => _SpaceViewBottomNavBarState();
}

class _SpaceViewBottomNavBarState extends State<SpaceViewBottomNavBar> {
  late int selectedIndex = widget.initialSelectedIndex;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
            HapticFeedback.lightImpact();
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'Picture',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
        ],
        // selectedItemColor: accentColor,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        showUnselectedLabels: true,
      ),
    );
  }
}
