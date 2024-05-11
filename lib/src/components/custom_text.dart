import 'package:flutter/material.dart';
import 'package:mmc_task/src/core/theme/app_textstyles.dart';

class CustomText extends StatelessWidget {
  final String text;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final AlignmentGeometry? alignment;

  const CustomText(
    this.text, {
    super.key,
    this.maxLines,
    this.alignment,
    this.textStyle,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.topLeft,
      child: Text(
        text,
        maxLines: maxLines ?? 1,
        overflow: TextOverflow.clip,
        textAlign: textAlign ?? TextAlign.start,
        style: textStyle ?? AppTextStyles.simpleBlackTextStyle(),
      ),
    );
  }
}
