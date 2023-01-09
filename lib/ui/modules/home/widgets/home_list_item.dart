import 'package:flutter/material.dart';
import 'package:sqflite_mvvm_design/core/resources/app_colors.dart';

import '../../../../data/models/Poet.dart';
import '../../../widgets/app_icon_button.dart';
import '../../poet_edit/poet_edit.dart';
import '../../poet_info/poet_info.dart';

Widget HomeListItem(
    BuildContext context,
    Poet poet,
    double itemHeight,
    double itemWidth,
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
                  height: 130,
                ),
                Text(poet.name ?? ""),
              ],
            ),
          ),
        ),
      ),
      Positioned(
        bottom: -50,
        left: 20,
        right: 20,
        child: Container(
          height: 120,
          width: itemWidth-40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.primary,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: AppIconButton(
                    icon: Icons.delete_outline,
                    onPress:(){},
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: AppIconButton(
                    icon: Icons.edit,
                    onPress:(){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              PoetEditScreen(title: poet.name ?? "",
                                  poetId: poet.id ?? 0)));
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: AppIconButton(
                    icon: Icons.info_outline_rounded,
                    onPress:(){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              PoetInfoScreen(title: poet.name ?? "",
                                  poetId: poet.id ?? 0)));
                    },
                  ),
                ),
              ],
          ),
        ),
      ),
    ],
  );
}