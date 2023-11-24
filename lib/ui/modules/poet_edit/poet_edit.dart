import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_mvvm_design/extension/extension.dart';
import 'package:sqflite_mvvm_design/ui/widgets/app_text_field.dart';
import '../../../core/enums/button_variant.dart';
import '../../../core/resources/color_manager.dart';
import '../../../data/models/Poet.dart';
import '../../../providers/poet_model.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_icon_button.dart';
import '../../widgets/select_photo/select_image_button.dart';

class PoetEditScreen extends StatelessWidget {
  final String id;
  const PoetEditScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    PoetModel poetModel = Provider.of<PoetModel>(context, listen: true);
    Poet poet = poetModel.findById(int.parse(id));

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('ویرایش'),
          actions: [
            AppIconButton(icon: Icons.chevron_right, onPress: (){
              if(Navigator.of(context).canPop()) Navigator.of(context).pop();
            }, color: ColorManager.white)
          ],
          leading: SizedBox(),
        ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Image(
              //   image: AssetImage(
              //     'assets/images/${poet.image}.jpg',
              //   ),
              //   height: 140,
              // ),
              SelectImageButton(
                image: poet.image,
                onClickTakePhoto: (imageFile) async {
                  File(imageFile).encodeToString().then(
                        (value) => poet.image = value,
                  );
                },
              ),
              AppTextField(
                value: poet.name,
                onSubmit: (newVal) {
                  poet.name = newVal;
                },
              ),
              AppTextField(
                value: poet.info,
                maxLines: 20,
                onSubmit: (newVal) {
                  poet.info = newVal;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              AppButton(
                onPress: () => poetModel.updatePoet(poet.id ?? -1, poet),
                text: "ویرایش",
                variant: ButtonVariantEnum.contained,
              )
            ],
          ),
        ),
      ),
    );
  }
}
