import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mmc_task/src/core/routes/app_routers.dart';

class AppSize {
  static double screenWidth = MediaQuery.of(AppRouter.context).size.height;
  static double screenHeight = MediaQuery.of(AppRouter.context).size.height;
  static double maxWidth = double.infinity;
  static double appBarElevation = 20.sp;
  static double widgetElevation = 10.sp;
  static double containerWidth = 50.w;
  static double containerHeight = 55.w;
  static double cardWidth = 42.w;
  static double cardHeight = 42.w;
  static double imageWidth = 45.sp;
  static double imageHeight = 45.sp;
  static double imageScale = 0.8;
  static double tapPadding = 10.sp;
  static double paddingAll = 20.sp;
  static double paddingLeft = 15.sp;
  static double paddingRight = 15.sp;
  static double paddingTop = 15.sp;
  static double paddingBottom = 15.sp;
  static double dividerThickness = 10.sp;
  static double headSize = 28.sp;
  static double buttonTextSize = 17.sp;
  static double textSize = 15.sp;
  static double middleSize = 18.sp;
  static double iconSize = 20.sp;
  static double buttonBorder = 12.sp;
  static double fieldBorder = 12.sp;
  static double containerBorder = 15.sp;
  static double logoHeight = 50.sp;
  static double logoWidth = 50.sp;

}
