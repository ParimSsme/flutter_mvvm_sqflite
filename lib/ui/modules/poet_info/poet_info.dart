import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_mvvm_design/ui/widgets/app_icon_button.dart';
import '../../../config/theme/app_theme.dart';
import '../../../core/resources/color_manager.dart';
import '../../../data/local/models/Poet.dart';
import '../../../providers/poet_model.dart';

class PoetInfoScreen extends StatelessWidget {
  final String id;
  const PoetInfoScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    PoetModel poetModel = Provider.of<PoetModel>(context, listen: true);
    Poet poet = poetModel.findById(int.parse(id));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(poet.name),
        actions: [
          AppIconButton(icon: Icons.chevron_right, onPress: (){
            if(Navigator.of(context).canPop()) Navigator.of(context).pop();
          }, color: ColorManager.white)
        ],
        leading: SizedBox(),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image(
              image: AssetImage(
                'assets/images/${poet.image}.jpg',
              ),
              height: 140,
            ),
            const SizedBox(height: 5),
            AppIconButton(
              icon: poet.isFavorite ? Icons.favorite : Icons.favorite_border,
              onPress: () => poetModel.toggleFavoritePoet(poet),
              color: ColorManager.primary,
            ),
            Text(
              poet.name,
              textAlign: TextAlign.center,
              style: AppTheme.light.textTheme.headline1,
            ),
            const SizedBox(height: 15),
            Text(poet.info,
                textAlign: TextAlign.right,
                style: AppTheme.light.textTheme.bodyText1),
          ],
        ),
      )),
    );
  }
}
