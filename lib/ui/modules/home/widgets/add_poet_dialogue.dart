import 'package:flutter/material.dart';
import 'package:sqflite_mvvm_design/ui/widgets/app_button.dart';
import 'package:sqflite_mvvm_design/ui/widgets/app_text_field.dart';
import 'package:sqflite_mvvm_design/ui/widgets/select_photo/select_image_button.dart';

import '../../../../core/enums/button_variant.dart';
import '../../../../data/models/Poet.dart';

Dialog AddPoetDialogue(
    void Function(Poet poet) onClickAdd
) {
  Poet updatedPoet = Poet();
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
    child: Container(
      height: 505,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SelectImageButton(

            ),
            AppTextField(
                hint: "Enter name",
                onSubmit: (val){
                  updatedPoet.name = val;
                }
            ),
            AppTextField(
                hint: "Enter info",
                onSubmit: (val){
                  updatedPoet.info = val;
                },
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
                      variant: ButtonVariantEnum.text,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 6, right: 12),
                    child: AppButton(
                      text: 'ذخیره',
                      variant: ButtonVariantEnum.text,
                      onPress: () {
                        updatedPoet.image = "";
                        onClickAdd(updatedPoet);
                      },
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