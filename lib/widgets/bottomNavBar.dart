import 'package:flutter/material.dart';
import 'package:space_view/theme/theme_constants.dart';


class SpaceViewBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  /*TODO 
  Figure out how to send the user to diffrent screens
    Possible solutins:
    -property Called onTap that can get a reference to a function
  Maybe try to use SF Symbols as they are already imported to the project, would have problems
  with the EULA of how they can be used

  Proper Colors From the theme constants file
  */
  SpaceViewBottomNavBar({
    required this.selectedIndex
  });

@override
Widget build(BuildContext context) {
  return SizedBox(height: 60, 
      child: BottomNavigationBar(
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
          currentIndex: selectedIndex,
          selectedItemColor: accentColor,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.black,
          showUnselectedLabels: true,
        ),
    );
}
}


