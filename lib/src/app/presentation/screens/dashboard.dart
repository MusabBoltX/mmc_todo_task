import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mmc_task/src/app/data/models/todo_model.dart';
import 'package:mmc_task/src/app/presentation/providers/task_provider.dart';
import 'package:mmc_task/src/app/presentation/screens/add_task.dart';
import 'package:mmc_task/src/app/presentation/screens/update_task.dart';
import 'package:mmc_task/src/app/presentation/widgets/data_tile.dart';
import 'package:mmc_task/src/components/custom_text.dart';
import 'package:mmc_task/src/components/prompts.dart';
import 'package:mmc_task/src/core/theme/app_colors.dart';
import 'package:mmc_task/src/core/utils/app_assets.dart';
import 'package:mmc_task/src/core/utils/app_extensions.dart';
import 'package:mmc_task/src/core/routes/app_routers.dart';
import 'package:mmc_task/src/core/utils/app_logger.dart';
import 'package:mmc_task/src/core/utils/app_size.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(context, ref) {
    final todosStream = ref.watch(todosStreamProvider.stream);
    final task = ref.watch(tasksProvider);

    return Scaffold(
      backgroundColor: AppColors.base,
      appBar: AppBar(
        title: CustomText(
          "Todos",
          textStyle: TextStyle(
            fontSize: AppSize.headSize / 1.2,
            fontWeight: FontWeight.w700,
            color: AppColors.title,
          ),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 8),
            width: 40.sp,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(AppAssets.avatar),
            ),
          ),
        ],
      ),
      body: Center(
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: StreamBuilder<List<Todo>>(
                stream: todosStream,
                builder: (context, snapshot) {
                  appPrint("DATA: ${snapshot.data?.asMap()}");
                  return RefreshIndicator(
                    onRefresh: () {
                      return task.sycWithFirebase();
                    },
                    child: ListView(
                      children: [
                        Divider(color: AppColors.borderGrey),
                        ListView.separated(
                          itemCount: snapshot.data?.length ?? 0,
                          shrinkWrap: true,
                          reverse: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, i) {
                            appPrint("Event: ${snapshot.data?[i].toJson()}");
                            return TodoTile(
                              title: snapshot.data?[i].title ?? "My task",
                              status: snapshot.data?[i].status ?? "Upcoming",
                              onEdit: () {
                                AppRouter.push(UpdateTask(
                                  todo: Todo(
                                    id: snapshot.data?[i].id ?? "",
                                    title: snapshot.data?[i].title ?? "",
                                    description:
                                        snapshot.data?[i].description ?? "",
                                    status:
                                        snapshot.data?[i].status ?? "Upcoming",
                                  ),
                                ));
                              },
                              onDelete: () {
                                Prompts.showLogoutAlert(
                                  context,
                                  title:
                                      "Are you sure you want to delete this task?",
                                  onDelete: () async =>
                                      await task.delete(snapshot.data?[i].id),
                                );
                              },
                            );
                          },
                          separatorBuilder: (_, i) {
                            return Divider(color: AppColors.borderGrey);
                          },
                        ),
                        kBottomNavigationBarHeight.ph,
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primaryGreen,
        foregroundColor: AppColors.primaryWhite,
        onPressed: () {
          AppRouter.push(const AddTask());
        },
        label: const Text("New Task"),
        icon: const Icon(Icons.create_rounded),
      ),
    );
  }
}
