// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mmc_task/src/components/custom_text.dart';
import 'package:mmc_task/src/core/theme/app_colors.dart';
import 'package:mmc_task/src/core/utils/app_size.dart';
import 'package:mmc_task/src/core/theme/app_textstyles.dart';

class ProductCard extends StatelessWidget {
  final String? username, cnic, meetTo, phone, status;
  final int? totalGuests;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    this.username,
    this.cnic,
    this.meetTo,
    this.status,
    this.onTap,
    this.phone,
    this.totalGuests,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.opaqueGreen),
              borderRadius: BorderRadius.circular(8.sp),
              color: AppColors.opaqueGreen,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.sp,
                        vertical: 8.sp,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            username ?? "",
                            textStyle: AppTextStyles.simpleBlackTextStyle(
                              textSize: AppSize.textSize * 1.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          // SizedBox(height: AppSize.paddingTop),
                          // Row(
                          //   crossAxisAlignment: CrossAxisAlignment.center,
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     CustomText(
                          //       "PKR ",
                          //       textStyle: AppTextStyles.simpleBlackTextStyle(
                          //         textSize: AppSize.middleSize * 1.0,
                          //         fontWeight: FontWeight.w500,
                          //       ),
                          //     ),
                          //     CustomText(
                          //       amount ?? "",
                          //       textStyle: AppTextStyles.simpleBlackTextStyle(
                          //         textSize: AppSize.middleSize * 1.2,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(height: AppSize.paddingTop),
                          Row(
                            children: [
                              CustomText(
                                "Meet to: ",
                                textStyle: AppTextStyles.simpleBlackTextStyle(
                                  textSize: AppSize.textSize * 1.2,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: AppSize.paddingRight / 2),
                              CustomText(
                                meetTo ?? "",
                                textStyle: AppTextStyles.simpleBlackTextStyle(
                                  textSize: AppSize.textSize * 1.3,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: AppSize.paddingTop),
                          Row(
                            children: [
                              CustomText(
                                "CNIC: ",
                                textStyle: AppTextStyles.simpleBlackTextStyle(
                                  textSize: AppSize.textSize * 1.2,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: AppSize.paddingRight / 2),
                              SizedBox(
                                width: AppSize.screenWidth / 1.5,
                                // color: Colors.white,
                                child: CustomText(
                                  cnic ?? "",
                                  textStyle: AppTextStyles.simpleBlackTextStyle(
                                    textSize: AppSize.textSize * 1.2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: AppSize.paddingTop),
                          Row(
                            children: [
                              CustomText(
                                "Phone: ",
                                textStyle: AppTextStyles.simpleBlackTextStyle(
                                  textSize: AppSize.textSize * 1.2,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: AppSize.paddingRight / 2),
                              CustomText(
                                phone ?? "",
                                textStyle: AppTextStyles.simpleBlackTextStyle(
                                  textSize: AppSize.textSize * 1.3,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: AppSize.paddingTop),
                          Row(
                            children: [
                              CustomText(
                                "Total Guests: ",
                                textStyle: AppTextStyles.simpleBlackTextStyle(
                                  textSize: AppSize.textSize * 1.2,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: AppSize.paddingRight / 2),
                              CustomText(
                                "${totalGuests ?? 1}",
                                textStyle: AppTextStyles.simpleBlackTextStyle(
                                  textSize: AppSize.textSize * 1.3,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Chip(
              backgroundColor: AppColors.primaryGreen,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              label: Text(
                status ?? "PENDING",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
