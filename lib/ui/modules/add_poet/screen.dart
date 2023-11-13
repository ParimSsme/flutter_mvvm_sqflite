import 'package:flutter/material.dart';
import '../../../core/enums/button_variant.dart';
import '../../../data/models/Poet.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/select_photo/select_image_button.dart';

class AddPoetScreen extends StatelessWidget {
  AddPoetScreen({super.key});

  final Poet newPoet = Poet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اضافه نمودن شاعر'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SelectImageButton(

              ),
              AppTextField(
                  hint: "Enter name",
                  onSubmit: (val){
                    newPoet.name = val;
                  }
              ),
              AppTextField(
                  hint: "Enter info",
                  onSubmit: (val){
                    newPoet.info = val;
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
}
