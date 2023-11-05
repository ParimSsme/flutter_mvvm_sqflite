import 'package:flutter/material.dart';
import 'package:sqflite_mvvm_design/config/theme/app_theme.dart';

class PoetInfoScreen extends StatelessWidget {
  const PoetInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('معلومات'),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Image(image: AssetImage(
                //   'assets/images/${state.poet?.image}.jpg',),
                //   height: 140,
                // ),
                // SizedBox(height: 5),
                // Text(state.poet?.name ?? "",
                //   textAlign: TextAlign.center,
                //   style: AppTheme.light.textTheme.headline1,
                // ),
                // SizedBox(height: 15),
                // Text(state.poet?.info ?? "",
                //     textAlign: TextAlign.right,
                //     style: AppTheme.light.textTheme.bodyText1
                // ),
              ],
            ),
          )
      ),
    );
  }
}