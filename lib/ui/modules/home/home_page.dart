import 'package:flutter/material.dart';
import 'package:sqflite_mvvm_design/data/models/Poet.dart';
import 'package:sqflite_mvvm_design/ui/modules/home/widgets/home_list_item.dart';
import '../../../data/services/poet_services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Poet> _poetList = <Poet>[];
  final _poetService = PoetService();

  getAllUserDetails() async {
    var poets = await _poetService.readAllPoets();
    _poetList = <Poet>[];
    poets.forEach((poet) {
      setState(() {
        var poetModel = Poet();
        poetModel.id = poet['id'];
        poetModel.name = poet['name'];
        poetModel.info = poet['info'];
        poetModel.image = poet['image'];
        _poetList.add(poetModel);
      });
    });
  }

  @override
  void initState() {
    getAllUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("شاعران")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
          children: List.generate(_poetList.length, (index) {
            return Expanded(
              child: HomeListItem(context, _poetList[index]),
            );
          }
          ),
        ),
      ),
    );
  }
}
