import 'package:flutter/material.dart';

import '../../../../data/models/Poet.dart';
import '../../poet_info/poet_info.dart';

Widget HomeListItem(BuildContext context, Poet poet) {
  return GestureDetector(
      onTap: () => {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                PoetInfoScreen(title: poet.name ?? "",
                    poetId: poet.id ?? 0)))
      },
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
      ));
}