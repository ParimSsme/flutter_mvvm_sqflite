import 'package:flutter/material.dart';

import '../../core/resources/app_colors.dart';

class SelectImageButton extends StatelessWidget {
  const SelectImageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Container(
            alignment: Alignment.center,
            constraints: const BoxConstraints(
              maxWidth: 100,
              maxHeight: 100,
            ),
            color: AppColors.background,
            child: const Icon(
              Icons.person,
              color: AppColors.gray,
              size: 70,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: ClipOval(
            child: Material(
              color: AppColors.primary, // Button color
              child: InkWell(
                splashColor: AppColors.white, // Splash color
                onTap: () {},
                child: SizedBox(width: 35,
                    height: 35,
                    child: Icon(
                      Icons.add, color: AppColors.white
                    )),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
