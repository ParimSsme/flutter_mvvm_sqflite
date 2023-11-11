import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_mvvm_design/providers/poet_model.dart';
import 'package:sqflite_mvvm_design/ui/modules/home/widgets/add_poet_dialogue.dart';
import 'package:sqflite_mvvm_design/ui/modules/home/widgets/home_list_item.dart';
import '../../../core/resources/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    const double itemHeight = 250;
    final double itemWidth = size.width / 2;

    PoetModel poetModel = Provider.of<PoetModel>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'شاعران',
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
                  Navigator.of(context).pushNamed(
                    ProductDetailScreen.routeName,
                    arguments: product.id,
                  )
                  // viewModel.onClickInfo(state.poets?[index] ?? Poet());
                },
                onClickEdit: () {
                  // viewModel.onClickEdit(state.poets?[index] ?? Poet());
                },
              );
            }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Dialog dialog = AddPoetDialogue(
            (poet) {
              poetModel.addPoet(poet);
              // viewModel.onClickAdd(poet);
            },
          );
          showDialog(
              context: context, builder: (BuildContext context) => dialog);
        }, // Add your onPressed code here!},
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add),
      ),
    );
    ;
  }
}
