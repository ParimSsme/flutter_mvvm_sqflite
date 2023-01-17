import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sqflite_mvvm_design/ui/modules/home/im.dart';
import '../../core/resources/app_colors.dart';

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
        imageFile == null
            ? ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Container(
            alignment: Alignment.center,
            constraints: const BoxConstraints(
              maxWidth: 100,
              maxHeight: 100,
            ),
            color: AppColors.background,
            child: const Icon(
              Icons.person,
              color: AppColors.gray,
              size: 70,
            ),
          ),
        ) : Container(
          child: Image.file(
            (imageFile!),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: ClipOval(
            child: Material(
              color: AppColors.primary, // Button color
              child: InkWell(
                splashColor: AppColors.white, // Splash color
                onTap: () {
                  Dialog dialog = AddPhotoDialogue(
                        (image) {
                          if (image != null){
                            setState((){
                              imageFile = image;
                            });
                          }
                    },
                  );
                  showDialog(
                      context: context, builder: (BuildContext context) => dialog);
                },
                child: SizedBox(width: 35,
                    height: 35,
                    child: Icon(
                      Icons.add, color: AppColors.white
                    )),
              ),
            ),
          ),
        ),
      ],
    );
  }
}