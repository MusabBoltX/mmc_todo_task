// import 'dart:io';
//
// import 'package:mmc_task/src/core/utils/app_exports.dart';
// import 'package:image_picker/image_picker.dart';
//
// class UploadImageBox extends StatelessWidget {
//   final XFile? pickedFile;
//   final File? loadedFile;
//   final Function()? onTap;
//
//   const UploadImageBox({
//     super.key,
//     this.onTap,
//     this.pickedFile,
//     this.loadedFile,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         height: 150.h,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: AppColors.opaqueGreen,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: pickedFile != null
//             ? ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: Image.file(
//                   loadedFile!,
//                   fit: BoxFit.cover,
//                 ),
//               )
//             : Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SvgPicture.asset(
//                     AppAssets.attachment,
//                     height: 40.sp,
//                     width: 40.sp,
//                   ),
//                   CustomText(
//                     "Upload Image",
//                     alignment: Alignment.center,
//                     textStyle: TextStyle(
//                       fontSize: AppSize.middleSize,
//                       fontWeight: FontWeight.w600,
//                       color: AppColors.title.withOpacity(0.5),
//                     ),
//                   ),
//                 ],
//               ),
//       ),
//     );
//   }
// }
