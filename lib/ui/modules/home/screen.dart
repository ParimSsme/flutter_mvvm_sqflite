import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_mvvm_design/providers/poet_model.dart';
import 'package:sqflite_mvvm_design/ui/modules/home/widgets/home_list_item.dart';
import '../../../config/router/routes.dart';
import '../../../core/resources/color_manager.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<PoetModel>(context).fetchAndSetPoets().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

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
        title: TextField(
          controller: _searchController,
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
          style: const TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: const InputDecoration(
            hintText: ' ... جستجو',
            hintStyle: TextStyle(color: Colors.white54),
            border: InputBorder.none,
          ),
          onChanged: (value) => poetModel.searchPoets(value),
        ),
      ),
      body: _isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : SafeArea(
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
                  AppNavigator.push(Routes.poetInfo, [(index+1).toString()]);
                },
                onClickEdit: () {
                  AppNavigator.push(Routes.poetEdit, [(index+1).toString()]);
                },
              );
            }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => AppNavigator.push(Routes.addPoet),
        backgroundColor: ColorManager.primary,
        child: const Icon(Icons.add),
      ),
    );
    ;
  }
}
