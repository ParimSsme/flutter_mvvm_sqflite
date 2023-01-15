import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  /// Icon to be used as button
  final IconData icon;

  /// Button's action. When `isEnabled` is false, it does nothing.
  final void Function() onPress;

  const AppIconButton({
    required this.icon,
    required this.onPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 30,
      onPressed: () => onPress(),
      icon: Icon(icon),
    );
  }
}
