import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mmc_task/src/app/data/models/todo_model.dart';
import 'package:mmc_task/src/app/data/sources/network.dart';
import 'package:mmc_task/src/core/utils/app_enums.dart';
import 'package:mmc_task/src/core/routes/app_routers.dart';
import 'package:mmc_task/src/core/utils/app_logger.dart';

final tasksProvider = ChangeNotifierProvider.autoDispose(
  (_) => TasksProvider(),
);

// State providers for todos and loading state
final todoServiceProvider = Provider((ref) => NetworkSource());

final todosStreamProvider = StreamProvider((ref) {
  final todoService = ref.watch(todoServiceProvider);
  return todoService.getTodos();
});

class TasksProvider extends ChangeNotifier {
  TasksProvider() {
    title = TextEditingController();
    description = TextEditingController();
  }

  @override
  void dispose() {
    title.dispose();
    description.dispose();
    super.dispose();
  }

  late TextEditingController title, description;
  final formKey = GlobalKey<FormState>();
  final NetworkSource _todo = NetworkSource();

  String selectedTask = TaskStatus.Upcoming.name;

  List<String> selectionItems = [
    TaskStatus.Upcoming.name,
    TaskStatus.InProgress.name,
    TaskStatus.Completed.name,
    TaskStatus.Cancelled.name,
  ];

  void onChanged(String? newValue) {
    appPrint(newValue);
    selectedTask = newValue!;
    notifyListeners();
  }

  _upload() async {
    await _todo.createTodo(
      Todo(
        title: title.text,
        description: description.text,
        status: TaskStatus.Upcoming.name,
      ),
    );
    AppRouter.back();
  }

  createTask() async {
    if (formKey.currentState!.validate()) {
      await _upload();
    }
  }

  void updateTask(id) async {
    if (formKey.currentState!.validate()) {
      await _update(id);
    }
  }

  void assignControllers(Todo todo) {
    title.text = todo.title ?? "";
    description.text = todo.description ?? "";
    selectedTask = todo.status ?? TaskStatus.Upcoming.name;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }

  _update(id) async {
    await _todo.updateTodo(
      id,
      Todo(
        title: title.text,
        description: description.text,
        status: selectedTask,
      ),
    );
    AppRouter.back();
  }

  delete(id) async {
    await _todo.deleteTodo(id);
    AppRouter.back();
  }

  Future<void> sycWithFirebase() async {}

  void initNewTask() {
    title.clear();
    description.clear();
  }
}
