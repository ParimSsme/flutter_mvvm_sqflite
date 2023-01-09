import 'package:flutter/material.dart';
import 'package:sqflite_mvvm_design/config/theme/app_theme.dart';

import '../../../data/models/Poet.dart';
import '../../../data/services/poet_services.dart';

class PoetInfoScreen extends StatefulWidget {

  final String title;
  final int poetId;

  const PoetInfoScreen({required this.title, required this.poetId});

  @override
  State<StatefulWidget> createState() {
    return _PoetInfoScreenState(this.title, this.poetId);
  }
}

class _PoetInfoScreenState extends State<PoetInfoScreen> {

  String title;
  int poetId;
  _PoetInfoScreenState(this.title, this.poetId);

  final _poetService = PoetService();
  Poet poet = Poet();

  _getPoetInfo() {
    _poetService.readPoetById(poetId).then((result) {
      setState(() {
        poet.id = result[0]['id'];
        poet.name = result[0]['name'];
        poet.info = result[0]['info'];
        poet.image = result[0]['image'];
      });
    });
  }

  @override
  void initState() {
    _getPoetInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(title,
          style: AppTheme.light.appBarTheme.textTheme?.headline3),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image(image: AssetImage(
                'assets/images/${poet.image}.jpg',),
                height: 140,
              ),
              SizedBox(height: 5),
              Text(poet.name ?? "",
                  textAlign: TextAlign.center,
                style: AppTheme.light.textTheme.headline1,
              ),
              SizedBox(height: 15),
              Text(poet.info ?? "",
                  textAlign: TextAlign.right,
                  style: AppTheme.light.textTheme.bodyText1
              ),
            ],
          ),
        )
      )
    );
  }
}