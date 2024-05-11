import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mmc_task/src/app/presentation/providers/task_provider.dart';
import 'package:mmc_task/src/components/custom_dropdown.dart';
import 'package:mmc_task/src/components/custom_textfield.dart';
import 'package:mmc_task/src/components/primary_button.dart';
import 'package:mmc_task/src/core/utils/app_exports.dart';
import 'package:mmc_task/src/core/theme/app_textstyles.dart';

class AddTask extends StatelessWidget {
  final String? id;

  const AddTask({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusNode().unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Consumer(
              builder: (context, ref, child) {
                var task = ref.watch(tasksProvider);
                task.initNewTask();
                return Form(
                  key: task.formKey,
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          const BackButton(),
                          Text(
                            "Create New Task",
                            style: AppTextStyles.headBlackBoldTextStyle,
                          ),
                        ],
                      ),
                      20.ph,
                      CustomTextField(
                        label: "Title",
                        controller: task.title,
                        keyboardType: TextInputType.text,
                      ),
                      10.ph,
                      CustomTextField(
                        label: "Description",
                        maxLines: 2,
                        controller: task.description,
                      ),
                      40.ph,
                      PrimaryButton(
                        onTap: task.createTask,
                        text: "Create Task",
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
