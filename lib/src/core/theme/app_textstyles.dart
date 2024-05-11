import 'package:flutter/material.dart';

import 'app_colors.dart';
import '../utils/app_size.dart';

class AppTextStyles {
  static TextStyle headerTextStyle = TextStyle(
    fontSize: AppSize.headSize,
    color: AppColors.title,
    fontWeight: FontWeight.normal,
  );

  static TextStyle headerTextBoldStyle(
      {double? textSize, Color? primaryWhite, FontWeight? textFont}) {
    return TextStyle(
        color: primaryWhite ?? AppColors.title,
        fontSize: textSize ?? AppSize.headSize,
        fontWeight: textFont ?? FontWeight.bold);
  }

  static TextStyle primaryColorBasicTextStyle = TextStyle(
    fontSize: AppSize.headSize,
    color: AppColors.primaryGreen,
    fontWeight: FontWeight.w500,
  );

  static TextStyle simpleBlackTextStyle(
      {double? textSize, Color? primaryWhite, FontWeight? fontWeight}) {
    return TextStyle(
        color: primaryWhite ?? AppColors.title,
        fontSize: textSize ?? AppSize.textSize,
        fontWeight: fontWeight ?? FontWeight.normal);
  }

  static TextStyle simpleBlackBoldTextStyle = TextStyle(
    fontSize: AppSize.textSize,
    color: AppColors.title,
    fontWeight: FontWeight.bold,
  );
  static TextStyle simpleWhiteTextStyle = TextStyle(
    fontSize: AppSize.textSize,
    color: AppColors.primaryWhite,
    fontWeight: FontWeight.normal,
  );
  static TextStyle simpleGreyTextStyle = TextStyle(
    fontSize: AppSize.textSize,
    color: AppColors.borderGrey,
    fontWeight: FontWeight.normal,
  );
  static TextStyle middleBlackTextStyle = TextStyle(
    fontSize: AppSize.middleSize,
    color: AppColors.title,
    fontWeight: FontWeight.normal,
  );
  static TextStyle middleBlackBoldTextStyle = TextStyle(
    fontSize: AppSize.middleSize,
    color: AppColors.title,
    fontWeight: FontWeight.bold,
  );
  static TextStyle middleGreyBoldTextStyle = TextStyle(
    fontSize: AppSize.middleSize,
    color: AppColors.borderGrey,
    fontWeight: FontWeight.bold,
  );
  static TextStyle middleWhiteBoldTextStyle = TextStyle(
    fontSize: AppSize.middleSize,
    color: AppColors.primaryWhite,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headBlackBoldTextStyle = TextStyle(
    fontSize: AppSize.middleSize * 1.2,
    color: AppColors.title,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headWhiteBoldTextStyle = TextStyle(
    fontSize: AppSize.middleSize * 1.2,
    color: AppColors.primaryWhite,
    fontWeight: FontWeight.bold,
  );
  static TextStyle middleGreyTextStyle = TextStyle(
    fontSize: AppSize.textSize,
    color: AppColors.borderGrey,
    fontWeight: FontWeight.w500,
  );
  static TextStyle followButtonTextStyle = TextStyle(
    fontSize: AppSize.buttonTextSize,
    color: AppColors.title,
    fontWeight: FontWeight.normal,
  );
  static TextStyle unFollowButtonTextStyle = TextStyle(
    fontSize: AppSize.buttonTextSize,
    color: AppColors.title,
    fontWeight: FontWeight.normal,
  );
  static TextStyle skipButtonTextStyle = TextStyle(
    fontSize: AppSize.buttonTextSize,
    color: AppColors.title,
    fontWeight: FontWeight.bold,
  );
}
