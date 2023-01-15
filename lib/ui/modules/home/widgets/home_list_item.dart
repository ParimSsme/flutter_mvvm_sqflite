import 'package:flutter/material.dart';
import 'package:sqflite_mvvm_design/config/theme/app_theme.dart';
import 'package:sqflite_mvvm_design/core/resources/app_colors.dart';
import '../../../../data/models/Poet.dart';
import '../../../widgets/app_icon_button.dart';
import '../../poet_info/poet_info.dart';

Widget HomeListItem(
    BuildContext context,
    Poet poet,
    double itemHeight,
    double itemWidth,
    void Function() onClickDelete,
    void Function() onClickInfo,
    void Function() onClickEdit
) {
  return Stack(
    children: [
      Container(
        height: itemHeight-60,
        width: itemWidth,
        child: Card(
          elevation: 10,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Image(image: AssetImage(
                  'assets/images/${poet.image}.jpg',),
                  height: 110,
                ),
                Text(poet.name ?? "",
                  style: AppTheme.light.textTheme.bodyText1,
                ),
              ],
            ),
          ),
        ),
      ),
      Positioned(
        bottom: 7,
        left: 20,
        right: 20,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.primary,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppIconButton(
                  icon: Icons.delete_outline,
                  onPress:(){
                    _showMyDialog(context,
                        poet.id ?? null,
                        onClickDelete
                    );
                  },
                ),
                AppIconButton(
                  icon: Icons.edit,
                  onPress:(){
                    onClickEdit();
                  },
                ),
                AppIconButton(
                  icon: Icons.info_outline_rounded,
                  onPress:(){
                    onClickInfo();
                  },
                ),
              ],
          ),
        ),
      ),
    ],
  );
}

Future<void> _showMyDialog(
    BuildContext context,
    int? poetId,
    void Function() onClickDelete,
) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('حذف'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('آیا میخواهید این شاعر را حذف نمایید؟'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('لغو'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('تایید'),
            onPressed: () {
              onClickDelete();
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}