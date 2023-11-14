import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../config/theme/app_theme.dart';
import '../../../data/models/Poet.dart';
import '../../../providers/poet_model.dart';

class PoetInfoScreen extends StatelessWidget {

  final String id;
  const PoetInfoScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {

    PoetModel poetModel = Provider.of<PoetModel>(context, listen: false);
    Poet poet = poetModel.findById(int.parse(id));

    return Scaffold(
      appBar: AppBar(
        title: Text(poet.name),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image(image: AssetImage(
                  'assets/images/${poet.image}.jpg',),
                  height: 140,
                ),
                const SizedBox(height: 5),
                Text(poet.name,
                  textAlign: TextAlign.center,
                  style: AppTheme.light.textTheme.headline1,
                ),
                const SizedBox(height: 15),
                Text(poet.info,
                    textAlign: TextAlign.right,
                    style: AppTheme.light.textTheme.bodyText1
                ),
              ],
            ),
          )
      ),
    );
  }
}