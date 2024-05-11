import 'package:flutter/material.dart';
import 'package:mmc_task/src/core/theme/app_colors.dart';

class CustomDropdown extends StatelessWidget {
  final String? value;
  final VoidCallback? onTap;
  final void Function(String?)? onChanged;
  final List<String>? items;

  const CustomDropdown(
    this.value, {
    super.key,
    this.items,
    this.onTap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: AppColors.primaryWhite,
          border: Border.all(color: AppColors.primaryGreen),
          borderRadius: BorderRadius.circular(8),
        ),
        child: DropdownButton<String>(
          value: value,
          underline: const SizedBox.shrink(),
          onChanged: onChanged,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryGreen,
          ),
          isExpanded: true,
          items: items?.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryGreen,
                ),
              ),
            );
          }).toList(),
        ),
        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text(
        //       "Sign In As",
        //       style: TextStyle(
        //         fontSize: 16,
        //         fontWeight: FontWeight.w500,
        //         color: AppColors.primaryGreen,
        //       ),
        //     ),
        //     const Icon(Icons.arrow_drop_down_rounded),
        //   ],
        // ),
      ),
    );
  }
}
