import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_view/managers/audioManager.dart';

class SoundSwitch extends StatefulWidget {
  const SoundSwitch({Key? key}) : super(key: key);

  @override
  _SoundSwitchState createState() => _SoundSwitchState();
}

class _SoundSwitchState extends State<SoundSwitch> {
  late bool isSoundEnabled;

  @override
  void initState() {
    super.initState();
    isSoundEnabled =
        Provider.of<AudioManager>(context, listen: false).isSoundEnabled;
  }

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: isSoundEnabled,
      onChanged: (value) {
        Provider.of<AudioManager>(context, listen: false).toggleSound(value);
        setState(() {
          isSoundEnabled = value;
        });
      },
    );
  }
}
