import 'package:mmc_task/src/core/utils/app_constants.dart';
import 'package:mmc_task/src/core/utils/app_enums.dart';
import 'package:mmc_task/src/core/utils/app_exports.dart';

class TodoTile extends StatelessWidget {
  final bool? onRent;
  final String? title, status;
  final VoidCallback? onEdit, onDelete;

  const TodoTile({
    super.key,
    this.title,
    this.onEdit,
    this.onRent,
    this.status,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AppAssets.avatar,
          width: 50.sp,
          height: 50.sp,
        ),
        10.pw,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                title ?? "",
                textStyle: TextStyle(
                  fontSize: AppSize.textSize,
                  fontWeight: FontWeight.w600,
                  color: AppColors.title,
                ),
              ),
              CustomText(
                status ?? TaskStatus.Upcoming.name,
                textStyle: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.subtitle,
                ),
              ),
            ],
          ),
        ),
        // const Spacer(),
        IconButton(
          icon: const Icon(Icons.edit_note_rounded),
          onPressed: onEdit,
        ),
        // 20.pw,
        IconButton(
          icon: const Icon(Icons.delete_outline_rounded),
          onPressed: onDelete,
        ),
      ],
    );
  }
}
