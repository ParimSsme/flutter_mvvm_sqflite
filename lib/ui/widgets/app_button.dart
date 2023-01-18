import 'package:flutter/material.dart';
import 'package:sqflite_mvvm_design/core/enums/button_variant.dart';
import 'package:sqflite_mvvm_design/core/resources/app_colors.dart';

class AppButton extends StatelessWidget {
  /// text to be used as button text
  final String text;

  // variant to render button type
  final ButtonVariantEnum variant;

  /// Button's action. When `isEnabled` is false, it does nothing.
  final void Function() onPress;

  const AppButton({
    required this.text,
    required this.variant,
    required this.onPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (variant) {
      case ButtonVariantEnum.text:
        return textButton(onPress, text);
      case ButtonVariantEnum.outlined:
        return outlinedButton(onPress, text);
      default:
        return containedButton(onPress, text);
    }
  }
}

Widget textButton(
    void Function() onPress,
    String text
) {
  return TextButton(
      onPressed: onPress,
      child: Text(text,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            color: AppColors.black
          )
      )
  );
}

Widget containedButton(
    void Function() onPress,
    String text
) {
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

Widget outlinedButton(
    void Function() onPress,
    String text
) {
  return OutlinedButton(
    onPressed: onPress,
    child: Text(text,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold)
    ),
  );
}