import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mmc_task/src/app/data/models/todo_model.dart';
import 'package:mmc_task/src/app/presentation/providers/task_provider.dart';
import 'package:mmc_task/src/components/custom_dropdown.dart';
import 'package:mmc_task/src/components/custom_textfield.dart';
import 'package:mmc_task/src/components/primary_button.dart';
import 'package:mmc_task/src/core/utils/app_exports.dart';
import 'package:mmc_task/src/core/theme/app_textstyles.dart';

class UpdateTask extends ConsumerStatefulWidget {
  final Todo todo;

  const UpdateTask({
    super.key,
    required this.todo,
  });

  @override
  ConsumerState<UpdateTask> createState() => _UpdateTaskState();
}

class _UpdateTaskState extends ConsumerState<UpdateTask> {

  @override
  void initState() {
    ref.read(tasksProvider).assignControllers(widget.todo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var task = ref.watch(tasksProvider);
    return GestureDetector(
      onTap: () => FocusNode().unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: task.formKey,
              child: ListView(
                children: [
                  Row(
                    children: [
                      const BackButton(),
                      Text(
                        "Update Task",
                        style: AppTextStyles.headBlackBoldTextStyle,
                      ),
                    ],
                  ),
                  40.ph,
                  CustomTextField(
                    label: "Title",
                    controller: task.title,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                  10.ph,
                  CustomTextField(
                    label: "Description",
                    controller: task.description,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                  10.ph,
                  CustomDropdown(
                    task.selectedTask,
                    items: task.selectionItems,
                    onChanged: task.onChanged,
                  ),
                  20.ph,
                  PrimaryButton(
                    onTap: () => task.updateTask(widget.todo.id),
                    text: "Update",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
