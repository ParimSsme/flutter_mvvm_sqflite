import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../config/router/routes.dart';
import '../../../providers/poet_model.dart';
import '../home/widgets/home_list_item.dart';

class FavoritesScreen extends StatefulWidget {
  FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    // ...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<PoetModel>(context).fetchAndSetFavoritePoets().then((_) {
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

    return _isLoading
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
                AppNavigator.push(
                    Routes.poetInfo, [(index + 1).toString()]);
              },
              onClickEdit: () {
                AppNavigator.push(
                    Routes.poetEdit, [(index + 1).toString()]);
              },
            );
          }),
        ),
      ),
    );
  }
}