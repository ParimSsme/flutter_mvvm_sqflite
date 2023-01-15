import 'package:flutter/material.dart';
import 'package:sqflite_mvvm_design/core/resources/app_colors.dart';

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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: AppColors.primary,
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          textStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold)
      ),
      onPressed: () => onPress(),
      child: Text(text),
    );
  }
}
