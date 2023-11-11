import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sqflite_mvvm_design/ui/widgets/select_photo/dialogue_box.dart';
import '../../../core/resources/color_manager.dart';

class SelectImageButton extends StatefulWidget {
  const SelectImageButton({Key? key}) : super(key: key);

  @override
  State<SelectImageButton> createState() => _SelectImageButtonState();
}

class _SelectImageButtonState extends State<SelectImageButton> {

  File? imageFile;

  @override
  Widget build(BuildContext context) {
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
            child: imageFile == null
                ?  const Icon(
              Icons.person,
              color: ColorManager.gray,
              size: 70,
            ) : Image.file(
              (imageFile!),
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
                  Dialog dialog = AddPhotoDialogue(
                        (image) {
                          if (image != null){
                            setState((){
                              imageFile = image;
                            });
                          }
                    },
                    context
                  );
                  showDialog(
                      context: context, builder: (BuildContext context) => dialog);
                },
                child: SizedBox(width: 35,
                    height: 35,
                    child: Icon(
                      Icons.add, color: ColorManager.white
                    )),
              ),
            ),
          ),
        ),
      ],
    );
  }
}