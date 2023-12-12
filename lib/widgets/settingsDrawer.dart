import 'package:flutter/material.dart';
import 'package:space_view/widgets/themeSwitch.dart';

class SettingsDrawer extends StatelessWidget {
  const SettingsDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210,
      height: 210,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(0, 0, 0, 0),
        body: Container(
          width: 210,
          height: 210,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withAlpha(200),
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dark Mode",
                    style: TextStyle(fontSize: 20),
                  ),
                  ThemeSwitch()
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sound",
                    style: TextStyle(fontSize: 20),
                  ),
                  Switch.adaptive(value: false, onChanged: (bool newValue) {})
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("About", style: TextStyle(fontSize: 20)),
                  Icon(Icons.info_outline_rounded),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
