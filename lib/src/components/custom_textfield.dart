import 'package:mmc_task/src/core/theme/app_colors.dart';
import 'package:mmc_task/src/core/utils/app_exports.dart';

class CustomTextField extends StatelessWidget {
  final Widget? suffixIcon, prefix, prefixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool? obscureText, enabled;
  final String? label;
  final int? maxLines;

  const CustomTextField({
    super.key,
    this.label,
    this.prefix,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.obscureText,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization,
    this.maxLines,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled ?? true,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.top,
      textInputAction: textInputAction ?? TextInputAction.next,
      textCapitalization: textCapitalization ?? TextCapitalization.words,
      controller: controller,
      obscureText: obscureText ?? false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType ?? TextInputType.text,
      validator: validator,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        counterText: "",
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryGreen),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primaryGreen),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primaryGreen),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.errorRed),
        ),
        hintText: label ?? "",
        isDense: true,
        suffixIcon: suffixIcon ??
            Padding(
              padding: EdgeInsets.only(left: 4.sp),
              child: Icon(
                Icons.visibility,
                color: AppColors.transparent,
              ),
            ),
        hintStyle: TextStyle(
          color: AppColors.primaryGreen,
          fontSize: 16,
        ),
      ),
    );
  }
}
