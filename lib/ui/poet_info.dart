import 'package:flutter/material.dart';

import '../data/DBHelper.dart';

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

  DBHelper helper = DBHelper();
  var poet;

  @override
  void initState() {
    super.initState();
    _getPoetInfo();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(title)),
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
              Text(poet.name, textAlign: TextAlign.center),
              Text(poet.info, textAlign: TextAlign.center),
            ],
          ),
        )
      )
    );
  }

  void _getPoetInfo() {
    helper.getPoetInfo(poetId).then((result) {
      setState(() => poet = result);
    });
  }
}