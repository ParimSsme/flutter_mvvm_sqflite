import 'package:flutter/material.dart';
import 'package:sqflite_mvvm_design/ui/widgets/app_text_field.dart';

import '../../../data/models/Poet.dart';
import '../../../data/services/poet_services.dart';

class PoetEditScreen extends StatefulWidget {

  final String title;
  final int poetId;

  const PoetEditScreen({required this.title, required this.poetId});

  @override
  State<StatefulWidget> createState() {
    return _PoetEditScreenState(this.title, this.poetId);
  }
}

class _PoetEditScreenState extends State<PoetEditScreen> {

  String title;
  int poetId;
  _PoetEditScreenState(this.title, this.poetId);

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
              AppTextField(
                hint: poet.name ?? "",
                onSubmit: (String) {  },
              ),

              AppTextField(
                hint: poet.info ?? "",
                onSubmit: (String) {  },
              ),
            ],
          ),
        )
      )
    );
  }
}