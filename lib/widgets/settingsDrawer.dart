import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:space_view/widgets/themeSwitch.dart';

class SettingsDrawer extends StatelessWidget {
  const SettingsDrawer({Key? key}) : super(key: key);

  @override
Widget build(BuildContext context) {
    return Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(26),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              //ThemeSwitch()
            ],
          ),
        );
}
}