import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mmc_task/src/core/utils/app_assets.dart';
import 'package:mmc_task/src/core/theme/app_colors.dart';
import 'package:mmc_task/src/core/utils/app_exports.dart';
import 'package:mmc_task/src/core/utils/app_extensions.dart';
import 'package:mmc_task/src/core/routes/app_routers.dart';
import 'package:mmc_task/src/core/utils/app_strings.dart';

class Prompts {
  static Future<void> noInternetDialog() async {
    ScaffoldMessenger.of(AppRouter.navKey.currentContext!).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        // backgroundColor: pinchToastColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            "No Internet Connection",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
            ),
          ),
        ),
        action: SnackBarAction(
          label: 'Close',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(AppRouter.navKey.currentContext!)
                .hideCurrentSnackBar();
          },
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }

  static void showSnackBar(String message, {Duration? duration}) {
    ScaffoldMessenger.of(AppRouter.navKey.currentContext!).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        // backgroundColor: pinchToastColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            message.contains('Exception:')
                ? message.replaceAll('Exception: ', '')
                : message,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
            ),
          ),
        ),
        action: SnackBarAction(
          label: 'Close',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(AppRouter.navKey.currentContext!)
                .hideCurrentSnackBar();
          },
        ),
        duration: duration ?? const Duration(seconds: 5),
      ),
    );
  }

  static void popMessenger(String message, {Duration? duration}) {
    ScaffoldMessenger.of(AppRouter.navKey.currentContext!).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        showCloseIcon: true,
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              Container(
                width: 30.w,
                height: 30.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.background,
                  border: Border.all(
                    color: AppColors.borderGrey,
                  ),
                ),
                child: SvgPicture.asset(AppAssets.iconCheck),
              ),
              10.pw,
              Text(
                message.contains('Exception:')
                    ? message.replaceAll('Exception: ', '')
                    : message,
                // style: AppTextTheme.titleMediumBlack14,
              ),
            ],
          ),
        ),
        duration: duration ?? const Duration(seconds: 5),
      ),
    );
  }

  static void showPermissionSnackBar(String message, VoidCallback onTap) {
    ScaffoldMessenger.of(AppRouter.navKey.currentContext!).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        // backgroundColor: pinchToastColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            message,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
            ),
          ),
        ),
        action: SnackBarAction(
          label: 'GO',
          textColor: Colors.white,
          onPressed: () {
            onTap();
            ScaffoldMessenger.of(AppRouter.context).hideCurrentSnackBar();
          },
        ),
        duration: const Duration(seconds: 6),
      ),
    );
  }

  static showLogoutAlert(
    context, {
    required String title,
    VoidCallback? onDelete,
    content,
  }) {
    return showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => CupertinoAlertDialog(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(title),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: const Text("Cancel"),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          CupertinoDialogAction(
            onPressed: onDelete,
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }

  static showDeleteAccountAlert(
    context, {
    required String title,
    required TextEditingController controller,
    VoidCallback? onSubmit,
    onTapSuffix,
    required bool isObscure,
    content,
  }) {
    return showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => CupertinoAlertDialog(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            title,
            // style: AppTextTheme.titleMediumBlue16?.copyWith(
            //   color: colorScheme.blueGray900,
            //   fontWeight: FontWeight.w500,
            // ),
          ),
        ),
        content: Column(
          children: [
            Text(
              content,
              // style: AppTextTheme.titleMediumBlack14?.copyWith(
              //   fontWeight: FontWeight.w400,
              // ),
            ),
            10.ph,
            CupertinoTextField(
              controller: controller,
              obscureText: isObscure,
              placeholder: Strings.password,
              // suffix: CupertinoButton(
              //   onPressed: onTapSuffix,
              //   child: SvgPicture.asset(
              //     !isObscure
              //         ? Assets.iconsVisibilityOff
              //         : Assets.iconsVisibilityOn,
              //   ),
              // ),
            ),
          ],
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: const Text(
              "Cancel",
              // style: AppTextTheme.titleMediumBlack16?.copyWith(
              //   color: theme.primaryColor,
              //   fontSize: 17.sp,
              //   fontWeight: FontWeight.w500,
              // ),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          CupertinoDialogAction(
            onPressed: onSubmit,
            child: const Text(
              "Confirm",
              // style: AppTheme..titleMediumBlack16?.copyWith(
              //   color: colorScheme.blueGray900,
              //   fontSize: 17.sp,
              //   fontWeight: FontWeight.w500,
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
