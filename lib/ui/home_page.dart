import 'package:flutter/material.dart';
import 'package:sqflite_mvvm_design/data/models/Poet.dart';
import 'package:sqflite_mvvm_design/ui/poet_info.dart';
import '../data/DBHelper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DBHelper helper = DBHelper();
  List<Poet> list = [];

  @override
  void initState() {
    super.initState();
    _getPoetList();
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
          children: List.generate(list.length, (index) {
            return Expanded(
              child: HomeItem(index, context),
            );
          }
          ),

        ),
      ),
    );
  }

  Widget HomeItem(int index, BuildContext context) {
    return GestureDetector(
        onTap: () => {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  PoetInfoScreen(title: list[index].name, poetId: index+1)))
        },
        child: Card(
          elevation: 10,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Image(image: AssetImage(
                    'assets/images/${list[index].image}.jpg',),
                  height: 130,
                ),
                Text(list[index].name),
              ],
            ),
          ),
        ));
  }

  void _getPoetList() {
    helper.getPoets().then((resultat) {
      setState(() => list = resultat);
    });
  }
}
