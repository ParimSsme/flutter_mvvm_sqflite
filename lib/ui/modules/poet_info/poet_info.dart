import 'package:flutter/material.dart';
import 'package:sqflite_mvvm_design/config/theme/app_theme.dart';
import 'package:sqflite_mvvm_design/ui/modules/poet_info/viewmodel.dart';
import '../../../core/base/view.dart';

class PoetInfoScreen extends View<PoetInfoScreenViewModel> {

  const PoetInfoScreen({required PoetInfoScreenViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _PoetInfoScreenState createState() => _PoetInfoScreenState(viewModel);
}

class _PoetInfoScreenState extends ViewState<PoetInfoScreen, PoetInfoScreenViewModel> {
  _PoetInfoScreenState(PoetInfoScreenViewModel viewModel) : super(viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PoetInfoScreenState>(
      stream: viewModel.state,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container();

        final state = snapshot.data!;

        return Scaffold(
          appBar: AppBar(
            title: const Text('معلومات'),
          ),
          body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Image(image: AssetImage(
                      'assets/images/${state.poet?.image}.jpg',),
                      height: 140,
                    ),
                    SizedBox(height: 5),
                    Text(state.poet?.name ?? "",
                      textAlign: TextAlign.center,
                      style: AppTheme.light.textTheme.headline1,
                    ),
                    SizedBox(height: 15),
                    Text(state.poet?.info ?? "",
                        textAlign: TextAlign.right,
                        style: AppTheme.light.textTheme.bodyText1
                    ),
                  ],
                ),
              )
          ),
        );
      },
    );
  }
}