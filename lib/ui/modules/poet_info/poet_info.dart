import 'package:flutter/material.dart';

class PoetInfoScreen extends StatelessWidget {

  final String id;
  const PoetInfoScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(id),
      ),
      body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
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