import 'package:flutter/material.dart';
import 'package:sqflite_mvvm_design/core/enums/database_tables.dart';
import 'package:sqflite_mvvm_design/data/helper/response_body.dart';
import 'package:sqflite_mvvm_design/data/models/Poet.dart';
import 'package:sqflite_mvvm_design/ui/modules/home/viewmodel.dart';
import 'package:sqflite_mvvm_design/ui/modules/home/widgets/home_list_item.dart';
import '../../../core/base/view.dart';
import '../../../data/services/poet_services.dart';

class HomeScreen extends View<HomeScreenViewModel> {
  const HomeScreen({required HomeScreenViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState(viewModel);
}

class _HomeScreenState extends ViewState<HomeScreen, HomeScreenViewModel> {
  _HomeScreenState(HomeScreenViewModel viewModel) : super(viewModel);

  late List<Poet> _poetList = <Poet>[];
  final _poetService = PoetService();

  getAllUserDetails() async {
    List<Poet> poets = await _poetService.readAllPoets();
    setState(() {
      _poetList.addAll(poets);
    });
  }

  @override
  void initState() {
    getAllUserDetails();
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    const double itemHeight = 350;
    final double itemWidth = size.width / 2;

    return StreamBuilder<HomeScreenState>(
      stream: viewModel.state,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container();

        final state = snapshot.data!;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Home Page'),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child:  GridView.count(
                shrinkWrap: true,
                childAspectRatio: (itemWidth/itemHeight),
                crossAxisCount: 2,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
                children: List.generate(_poetList.length, (index) {
                  return Expanded(
                    child: HomeListItem(
                        context,
                        _poetList[index],
                        itemHeight,
                        itemWidth,
                            (){}
                    ),
                  );
                }
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}