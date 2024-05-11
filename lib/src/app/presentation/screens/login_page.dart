// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:mmc_task/src/components/custom_dropdown.dart';
// import 'package:mmc_task/src/components/custom_text.dart';
// import 'package:mmc_task/src/components/custom_textfield.dart';
// import 'package:mmc_task/src/components/primary_button.dart';
// import 'package:mmc_task/src/core/utils/app_assets.dart';
// import 'package:mmc_task/src/core/theme/app_colors.dart';
// import 'package:mmc_task/src/core/utils/app_extensions.dart';
// import 'package:mmc_task/src/core/utils/app_size.dart';
// import 'package:mmc_task/src/core/utils/app_strings.dart';
// import 'package:mmc_task/src/core/utils/app_validators.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   @override
//   Widget build(_) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: EdgeInsets.all(16.w),
//           child: SafeArea(
//             child: Consumer(
//               builder: (context, ref, child) {
//                 var auth = ref.watch(authProvider);
//                 return Form(
//                   key: auth.formKey,
//                   child: ListView(
//                     children: [
//                       20.ph,
//                       CustomText(
//                         "Hello Partner 👋",
//                         textStyle: TextStyle(
//                           fontSize: AppSize.headSize * 1.125,
//                           fontWeight: FontWeight.bold,
//                           color: AppColors.title,
//                         ),
//                       ),
//                       CustomText(
//                         "Welcome to HealthSolutions",
//                         textStyle: TextStyle(
//                           fontSize: AppSize.middleSize,
//                           fontWeight: FontWeight.w400,
//                           color: AppColors.title.withOpacity(0.5),
//                         ),
//                       ),
//                       10.ph,
//                       SvgPicture.asset(AppAssets.imageLogin, width: 250),
//                       10.ph,
//                       CustomTextField(
//                         label: Strings.email,
//                         controller: auth.email,
//                         textCapitalization: TextCapitalization.none,
//                         validator: AppValidators.validateEmail,
//                       ),
//                       10.ph,
//                       CustomTextField(
//                         label: "Password",
//                         obscureText: auth.visible,
//                         validator: AppValidators.validatePassword,
//                         suffixIcon: InkWell(
//                           onTap: auth.toggle,
//                           child: Icon(
//                             auth.visible
//                                 ? Icons.visibility_outlined
//                                 : Icons.visibility_off_outlined,
//                             size: 24.sp,
//                             color: AppColors.primaryGreen,
//                           ),
//                         ),
//                       ),
//                       20.ph,
//                       CustomText(
//                         "Sign In As?",
//                         textStyle: TextStyle(
//                           fontSize: AppSize.middleSize,
//                           fontWeight: FontWeight.w600,
//                           color: AppColors.title.withOpacity(0.5),
//                         ),
//                       ),
//                       10.ph,
//                       CustomDropdown(
//                         auth.selectedValue,
//                         items: auth.selectionItems,
//                         onChanged: auth.onChanged,
//                       ),
//                       20.ph,
//                       PrimaryButton(
//                         onTap: auth.validateLogin,
//                         text: "Login",
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
