import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mmc_task/src/app/data/models/todo_model.dart';
import 'package:mmc_task/src/app/data/sources/local.dart';
import 'package:mmc_task/src/app/data/sources/network.dart';
import 'package:mmc_task/src/core/utils/app_enums.dart';
import 'package:mmc_task/src/core/routes/app_routers.dart';
import 'package:mmc_task/src/core/utils/app_logger.dart';

final tasksProvider = ChangeNotifierProvider.autoDispose(
      (_) => TasksProvider(),
);

class TasksProvider extends ChangeNotifier {
  TasksProvider() {
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    getTasks();
    title = TextEditingController();
    description = TextEditingController();
  }

  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
      appPrint("connectivity result: ${result.name}");
    } on PlatformException catch (e) {
      appLog('Couldn\'t check connectivity status');
      return;
    }

    return _updateConnectionStatus(result);
  }

  bool isConnected = false;

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus = result;
    if (_connectionStatus == ConnectivityResult.none) {
      isConnected = false;
    } else {
      isConnected = true;
    }
    notifyListeners();
    await getTasks();
    appPrint("Connection: $_connectionStatus :: $result: isConnected: $isConnected");
  }

  @override
  void dispose() {
    title.dispose();
    description.dispose();
    _connectivitySubscription.cancel();
    super.dispose();
  }

  late TextEditingController title, description;
  final formKey = GlobalKey<FormState>();
  final NetworkSource _onlineTodo = NetworkSource();
  final OfflineSource _offlineTodo = OfflineSource();

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
    await _onlineTodo.createTodo(
      Todo(
        title: title.text,
        description: description.text,
        status: TaskStatus.Upcoming.name,
      ),
      connected: isConnected,
    );
    await getTasks();
    AppRouter.back();
  }

  createTask() async {
    if (formKey.currentState!.validate()) {
      await _upload();
    }
  }

  List<Todo> todos = [];

  getTasks() async {
    try {
      todos = await _onlineTodo.getTodos();
      appPrint("todos.length: ${todos.length}");
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> sycWithFirebase() async {
    todos = await _offlineTodo.getOfflineTodos();
    appPrint("Offline Todos: ${todos.length}");
    await _onlineTodo.syncWithFirebase(todos);
    await getTasks();
    notifyListeners();
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
    await _onlineTodo.updateTodo(
      id,
      Todo(
        title: title.text,
        description: description.text,
        status: selectedTask,
      ),
    );
    await getTasks();
    AppRouter.back();
  }

  delete(id) async {
    await _onlineTodo.deleteTodo(id);
    await getTasks();
    AppRouter.back();
  }

  deleteBatch() async {
    await _offlineTodo.deleteAllTodos();
    await _onlineTodo.deleteTodos(todos);
    await getTasks();
  }

  void initNewTask() {
    title.clear();
    description.clear();
  }
}
