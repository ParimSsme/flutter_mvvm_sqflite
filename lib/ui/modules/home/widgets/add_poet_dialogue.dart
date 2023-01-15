import 'package:flutter/material.dart';
import 'package:sqflite_mvvm_design/core/resources/app_colors.dart';
import 'package:sqflite_mvvm_design/ui/widgets/app_button.dart';
import 'package:sqflite_mvvm_design/ui/widgets/app_text_field.dart';
import 'package:sqflite_mvvm_design/ui/widgets/select_image_button.dart';

Dialog AddPoetDialogue() {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
//this right here
    child: Container(
      height: 505,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SelectImageButton(),
            AppTextField(
                hint: "Enter name",
                onSubmit: (val){}
            ),
            AppTextField(
                hint: "Enter info",
                onSubmit: (val){},
                maxLines: 10
            ),
            Expanded(child: Container()),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 12, right: 6),
                    child: AppButton(
                      text: 'لغو',
                      onPress: () {  },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 6, right: 12),
                    child: AppButton(
                      text: 'ذخیره',
                      onPress: () {  },
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}