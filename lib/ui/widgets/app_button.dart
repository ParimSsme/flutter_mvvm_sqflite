import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  /// text to be used as button text
  final String text;

  /// Button's action. When `isEnabled` is false, it does nothing.
  final void Function() onPress;

  const AppButton({
    required this.text,
    required this.onPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPress(),
      child: Text(text),
    );
  }
}
