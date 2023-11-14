import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_mvvm_design/providers/poet_model.dart';
import 'package:sqflite_mvvm_design/ui/modules/home/widgets/home_list_item.dart';
import '../../../config/router/routes.dart';
import '../../../core/resources/color_manager.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController _searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    const double itemHeight = 250;
    final double itemWidth = size.width / 2;

    PoetModel poetModel = Provider.of<PoetModel>(context, listen: true);

    void myFunction(String message) {
      poetModel.searchPoets(message);
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextField(
          controller: _searchController,
          style: const TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: const InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.white54),
            border: InputBorder.none,
          ),
          onChanged: (value) {
            Isolate.spawn(myFunction, value);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.count(
            shrinkWrap: true,
            childAspectRatio: (itemWidth / itemHeight),
            crossAxisCount: 2,
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
            children: List.generate(poetModel.poets.length, (index) {
              return HomeListItem(
                poet: poetModel.poets[index],
                itemHeight: itemHeight,
                itemWidth: itemWidth,
                onClickDelete: () {
                  poetModel.deletePoet(poetModel.poets[index].id);
                },
                onClickInfo: () {
                  AppNavigator.push(Routes.poetInfo, ["1"]);
                },
                onClickEdit: () {
                },
              );
            }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => AppNavigator.push(Routes.addPoet, ['556']),
        backgroundColor: ColorManager.primary,
        child: const Icon(Icons.add),
      ),
    );
    ;
  }
}
