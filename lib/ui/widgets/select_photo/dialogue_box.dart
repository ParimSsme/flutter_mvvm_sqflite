import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sqflite_mvvm_design/config/theme/app_theme.dart';
import 'package:sqflite_mvvm_design/core/enums/button_variant.dart';
import 'package:sqflite_mvvm_design/core/resources/color_manager.dart';
import 'package:sqflite_mvvm_design/ui/widgets/app_button.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotoDialogue extends StatelessWidget {

  final void Function(String image) onClickTakePhoto;
  final BuildContext context;

  const AddPhotoDialogue({
    super.key,
    required this.onClickTakePhoto,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: SizedBox(
        height: 240,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "انتخاب عکس",
                style: AppTheme.light.textTheme.headline2,
                textAlign: TextAlign.left,
              ),
              const Divider(color: ColorManager.gray, height: 2),
              AppButton(
                onPress: () async {
                  final imageFile = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                    maxWidth: 600,
                  );
                  onClickTakePhoto(imageFile?.path ?? '');
                  Navigator.pop(context);
                },
                text: "گالری",
                variant: ButtonVariantEnum.text,
              ),
              AppButton(
                onPress: () async {
                  final pickedFile = await ImagePicker().pickImage(
                    source: ImageSource.camera,
                    maxWidth: 1800,
                    maxHeight: 1800,
                  );
                  onClickTakePhoto(pickedFile?.path ?? '');
                  Navigator.pop(context);
                },
                text: "کامره",
                variant: ButtonVariantEnum.text,
              )
            ],
          ),
        ),
      ),
    );
  }
}
