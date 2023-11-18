import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_mvvm_design/ui/widgets/app_text_field.dart';
import '../../../core/enums/button_variant.dart';
import '../../../data/models/Poet.dart';
import '../../../providers/poet_model.dart';
import '../../widgets/app_button.dart';
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
        title: const Text('ویرایش'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child:  Column(
            children: [
              Image(image: AssetImage(
                'assets/images/${poet.image}.jpg',),
                height: 140,
              ),
              SelectImageButton(onClickTakePhoto: (imageFile) async {
                Uint8List imgbytes = await imageFile.readAsBytes();
                String bs4str = base64.encode(imgbytes);
                poet.image = bs4str;
              },),
              AppTextField(
                hint: "نام",
                value: poet.name,
                onSubmit: (newVal) {
                  poet.name = newVal;
                },
              ),

              AppTextField(
                hint: "توضیحات",
                value: poet.info,
                maxLines: 20,
                onSubmit: (newVal) {
                  poet.info = newVal;
                },
              ),

              const SizedBox(height: 20,),

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