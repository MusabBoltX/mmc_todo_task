import 'package:flutter_svg/flutter_svg.dart';
import 'package:mmc_task/src/core/utils/app_assets.dart';
import 'package:mmc_task/src/core/theme/app_colors.dart';
import 'package:mmc_task/src/core/utils/app_strings.dart';

import '../core/utils/app_exports.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool loader, enabled;
  final Color? backgroundColor, textColor;
  final double height;
  final double width;

  const PrimaryButton({
    super.key,
    required this.onTap,
    required this.text,
    this.loader = false,
    this.backgroundColor,
    this.textColor,
    this.height = 48,
    this.width = double.infinity,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height.h,
      child: ElevatedButton(
        onPressed: enabled ? onTap : null,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: enabled
              ? loader
                  ? AppColors.primaryGreen
                  : (backgroundColor ?? AppColors.primaryGreen)
              : AppColors.borderGrey,
          elevation: 0,
        ),
        child: loader == true
            ? const SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 4.0,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: text == Strings.submitted,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: SvgPicture.asset(AppAssets.iconCheck),
                    ),
                  ),
                  Text(
                    text,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: enabled
                              ? (textColor ?? Colors.white)
                              : AppColors.borderGrey,
                        ),
                  ),
                ],
              ),
      ),
    );
  }
}
