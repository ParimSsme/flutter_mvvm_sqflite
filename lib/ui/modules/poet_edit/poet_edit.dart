import 'package:flutter/material.dart';
import 'package:sqflite_mvvm_design/ui/widgets/app_text_field.dart';
import '../../../core/enums/button_variant.dart';
import '../../widgets/app_button.dart';

class PoetEditScreen extends StatelessWidget {
  const PoetEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ویرایش'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child:  Column(
            children: [
              // Image(image: AssetImage(
              //   'assets/images/${state.poet?.image}.jpg',),
              //   height: 140,
              // ),
              // AppTextField(
              //   hint: "نام",
              //   value: state.poet?.name ?? "",
              //   onSubmit: (newVal) {
              //     state.poet?.name = newVal;
              //   },
              // ),
              //
              // AppTextField(
              //   hint: "توضیحات",
              //   value: state.poet?.info ?? "",
              //   maxLines: 20,
              //   onSubmit: (newVal) {
              //     state.poet?.info = newVal;
              //   },
              // ),

              const SizedBox(height: 20,),

              AppButton(
                onPress: () {
                },
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