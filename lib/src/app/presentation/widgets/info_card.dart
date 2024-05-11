import 'package:mmc_task/src/components/custom_text.dart';
import 'package:mmc_task/src/core/theme/app_colors.dart';
import 'package:mmc_task/src/core/theme/app_decorations.dart';
import 'package:mmc_task/src/core/utils/app_exports.dart';
import 'package:mmc_task/src/core/utils/app_logger.dart';
import 'package:mmc_task/src/core/utils/app_size.dart';
import 'package:mmc_task/src/core/theme/app_textstyles.dart';

class InfoCard extends StatelessWidget {
  final String? title, unit, value;
  final Color? color;

  const InfoCard({
    super.key,
    this.color,
    this.title,
    this.unit,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: AppSize.screenWidth / 5,
        minWidth: AppSize.screenWidth / 7,
        maxHeight: AppSize.screenHeight / 7,
        minHeight: AppSize.screenHeight / 7,
      ),
      padding: EdgeInsets.all(12.sp),
      decoration: AppDecorations.allCurved(
        color: color ?? AppColors.peachBg,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              CustomText(
                value ?? "12400",
                textStyle: AppTextStyles.headBlackBoldTextStyle,
              ),
              CustomText(
                " ${unit ?? "PKR"}",
                textStyle: AppTextStyles.followButtonTextStyle,
              ),
            ],
          ),
          CustomText(
            title ?? "Total Sales",
            alignment: Alignment.bottomRight,
            textStyle: AppTextStyles.middleBlackTextStyle,
          ),
        ],
      ),
    );
  }
}
