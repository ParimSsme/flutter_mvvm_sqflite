import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite_mvvm_design/config/theme/app_theme.dart';
import 'package:sqflite_mvvm_design/core/enums/button_variant.dart';
import 'package:sqflite_mvvm_design/core/resources/app_colors.dart';
import 'package:sqflite_mvvm_design/ui/widgets/app_button.dart';


Dialog AddPhotoDialogue(
    void Function(File? imageFile) onClickTakePhoto,
    BuildContext context
) {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
    child: Container(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text("Select Photo",
              style: AppTheme.light.textTheme.headline2,
              textAlign: TextAlign.left,
            ),
            const Divider(color: AppColors.gray, height: 2),
            AppButton(
              onPress: () {
                _getFromGallery().then((val) {
                  onClickTakePhoto(val);
                });
                Navigator.pop(context);
              },
              text: "PICK FROM GALLERY",
              variant: ButtonVariantEnum.text,
            ),
            Container(
              height: 40.0,
            ),
            AppButton(
              onPress: () {
                _getFromCamera().then((val) {
                  onClickTakePhoto(val);
                });
                Navigator.pop(context);
              },
              text: "PICK FROM CAMERA",
              variant: ButtonVariantEnum.text,
            )
          ],
        ),
      ),
    ),
  );
}

Future<File?> _getFromGallery() async {
  PickedFile pickedFile = await ImagePicker().getImage(
    source: ImageSource.gallery,
    maxWidth: 1800,
    maxHeight: 1800,
  );
  if (pickedFile != null) {
    return File(pickedFile.path);
  } else {
    return null;
  }
}

Future<File?> _getFromCamera() async {
  PickedFile pickedFile = await ImagePicker().getImage(
    source: ImageSource.camera,
    maxWidth: 1800,
    maxHeight: 1800,
  );
  if (pickedFile != null) {
    return File(pickedFile.path);
  } else {
    return null;
  }
}
