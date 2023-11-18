import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sqflite_mvvm_design/ui/widgets/select_photo/dialogue_box.dart';
import '../../../core/resources/color_manager.dart';

class SelectImageButton extends StatefulWidget {

  final File? imageFile;
  final void Function(File imageFile) onClickTakePhoto;

  const SelectImageButton({
    super.key,
    required this.onClickTakePhoto,
    required this.imageFile,
  });

  @override
  State<SelectImageButton> createState() => _SelectImageButtonState();
}

class _SelectImageButtonState extends State<SelectImageButton> {

  File? imageFile;

  @override
  Widget build(BuildContext context) {

    imageFile = widget.imageFile;

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Container(
            alignment: Alignment.center,
            constraints: const BoxConstraints(
              maxWidth: 100,
              maxHeight: 100,
            ),
            color: ColorManager.background,
            child: widget.imageFile == null
                ? const Icon(
                    Icons.person,
                    color: ColorManager.gray,
                    size: 70,
                  )
                : Image.file(
                    (widget.imageFile!),
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: ClipOval(
            child: Material(
              color: ColorManager.primary, // Button color
              child: InkWell(
                splashColor: ColorManager.white, // Splash color
                onTap: () {
                  Widget dialog = AddPhotoDialogue(
                    context: context,
                    onClickTakePhoto: (File? image) {
                      if (image != null) {
                        setState(() {
                          imageFile = image;
                        });
                        widget.onClickTakePhoto(image);
                      }
                    },
                  );
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => dialog);
                },
                child: const SizedBox(
                    width: 35,
                    height: 35,
                    child: Icon(Icons.add, color: ColorManager.white)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
