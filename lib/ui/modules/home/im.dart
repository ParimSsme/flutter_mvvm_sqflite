import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite_mvvm_design/ui/widgets/app_button.dart';


Dialog AddPhotoDialogue(
    void Function(File? imageFile) onClickTakePhoto
) {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
    child: Container(
      height: 200,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Select Photo"),
            Divider(),
            AppButton(
              onPress: () {
                _getFromGallery().then((val) {
                  onClickTakePhoto(val);
                });
              },
              text: "PICK FROM GALLERY",
            ),
            Container(
              height: 40.0,
            ),
            AppButton(
              onPress: () {
                _getFromCamera().then((val) {
                  onClickTakePhoto(val);
                });
              },
              text: "PICK FROM CAMERA",
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
