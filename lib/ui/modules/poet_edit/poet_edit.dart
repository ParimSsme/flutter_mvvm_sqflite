import 'package:flutter/material.dart';
import 'package:sqflite_mvvm_design/ui/modules/poet_edit/viewmodel.dart';
import 'package:sqflite_mvvm_design/ui/widgets/app_text_field.dart';
import '../../../core/base/view.dart';
import '../../../core/enums/button_variant.dart';
import '../../widgets/app_button.dart';

class PoetEditScreen extends View<PoetEditScreenViewModel> {

  const PoetEditScreen({required PoetEditScreenViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _PoetEditScreenState createState() => _PoetEditScreenState(viewModel);
}

class _PoetEditScreenState extends ViewState<PoetEditScreen, PoetEditScreenViewModel> {
  _PoetEditScreenState(PoetEditScreenViewModel viewModel) : super(viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PoetEditScreenState>(
      stream: viewModel.state,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container();

        final state = snapshot.data!;

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
                    'assets/images/${state.poet?.image}.jpg',),
                    height: 140,
                  ),
                  AppTextField(
                    hint: "نام",
                    value: state.poet?.name ?? "",
                    onSubmit: (newVal) {
                      state.poet?.name = newVal;
                    },
                  ),

                  AppTextField(
                    hint: "توضیحات",
                    value: state.poet?.info ?? "",
                    maxLines: 20,
                    onSubmit: (newVal) {
                      state.poet?.info = newVal;
                    },
                  ),

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
      },
    );
  }
}