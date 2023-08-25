import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton({super.key});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool light = true;

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith((Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return const Icon(Icons.brightness_4, color: Colors.black);
    }
    return const Icon(Icons.brightness_2);
  });
  @override
  Widget build(BuildContext context) {
    return Switch(
      activeColor: Colors.yellow,
      value: light,
      thumbIcon: thumbIcon,
      onChanged: (bool value) => setState(() {
        light = value;
        if (light) {
          Get.changeThemeMode(ThemeMode.light);
        } else {
          Get.changeThemeMode(ThemeMode.dark);
        }
      }),
      // splashRadius: 25,
    );
  }
}
