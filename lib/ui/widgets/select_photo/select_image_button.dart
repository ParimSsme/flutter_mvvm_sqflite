import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sqflite_mvvm_design/ui/widgets/select_photo/dialogue_box.dart';
import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/color_manager.dart';

class SelectImageButton extends StatefulWidget {
  final String image;
  final void Function(String image) onClickTakePhoto;

  const SelectImageButton({
    super.key,
    required this.onClickTakePhoto,
    required this.image,
  });

  @override
  State<SelectImageButton> createState() => _SelectImageButtonState();
}

class _SelectImageButtonState extends State<SelectImageButton> {
  String image = '';

  @override
  Widget build(BuildContext context) {
    const imageSize = 110.0;

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Container(
            alignment: Alignment.center,
            constraints: BoxConstraints(
              maxWidth: imageSize,
              maxHeight: imageSize,
            ),
            color: ColorManager.background,
            child: (widget.image.length > 11)
                ? Image.memory(
                    base64Decode(widget.image),
                    fit: BoxFit.cover,
                    height: imageSize,
                    width: imageSize,
                  )
                : (widget.image.isEmpty)
                    ? const Icon(
                        Icons.person,
                        color: ColorManager.gray,
                        size: 70,
                      )
                    : Image(
                        image: AssetImage(
                          '$imagePath/${widget.image}.$imageType',
                        ),
                        fit: BoxFit.cover,
                        height: imageSize,
                        width: imageSize,
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
                    onClickTakePhoto: (String image) {
                      setState(() {
                        image = image;
                      });
                      widget.onClickTakePhoto(image);
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
