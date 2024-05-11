import 'package:flutter/cupertino.dart';
import 'package:mmc_task/src/core/theme/app_colors.dart';
import 'package:mmc_task/src/core/utils/app_size.dart';

class AppDecorations {
  static BoxDecoration topCurved({Color? color}) => BoxDecoration(
    color: color ?? AppColors.primaryWhite,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(AppSize.containerBorder * 2),
      topRight: Radius.circular(AppSize.containerBorder * 2),
    ),
  );

  static BoxDecoration allCurved({Color? color}) {
    return BoxDecoration(
      color: color ?? AppColors.primaryWhite,
      boxShadow: [
        BoxShadow(color: color ?? AppColors.background),
      ],
      borderRadius: BorderRadius.all(
        Radius.circular(AppSize.containerBorder),
      ),
    );
  }
}
