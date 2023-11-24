import 'package:flutter/material.dart';
import 'package:sqflite_mvvm_design/core/enums/button_variant.dart';
import 'package:sqflite_mvvm_design/core/resources/color_manager.dart';

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
    super.key,
  });

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
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            color: ColorManager.black
          )
      )
  );
}

Widget containedButton(
    void Function() onPress,
    String text
) {
  return Container(
    height: 45,
    width: 150,
    decoration: BoxDecoration(
        color: ColorManager.primary,
        borderRadius: const BorderRadius.all(
          Radius.circular(25.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 10,
            offset: const Offset(0, 3),
          )
        ]
    ),
    child: Center(
      child: GestureDetector(
        onTap: () => onPress(),
        child: Text(
          text,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontFamily: "Netflix",
            fontWeight: FontWeight.w600,
            fontSize: 18,
            letterSpacing: 0.0,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}

Widget outlinedButton(
    void Function() onPress,
    String text
) {
  return OutlinedButton(
    onPressed: onPress,
    child: Text(text,
        style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold)
    ),
  );
}