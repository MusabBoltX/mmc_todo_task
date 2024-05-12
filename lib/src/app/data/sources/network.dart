import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mmc_task/src/app/data/models/todo_model.dart';
import 'package:mmc_task/src/app/data/sources/local.dart';
import 'package:mmc_task/src/components/prompts.dart';
import 'package:mmc_task/src/core/routes/app_routers.dart';
import 'package:mmc_task/src/core/utils/app_logger.dart';

class NetworkSource {
  final _database = FirebaseDatabase.instance.ref().child('todos');
  final OfflineSource _offlineSource = OfflineSource();

  // Create
  Future<void> createTodo(Todo task, {required bool connected}) async {
    appPrint("connected: $connected");
    if (connected) {
      try {
        final ref = _database.push();
        await ref.set({
          "id": ref.key,
          "title": task.title,
          "description": task.description,
          "status": task.status,
        });
      } on FirebaseException catch (e) {
        appPrint('Error creating todo: $e');
        // AppRouter.back();
      }
    } else {
      await _offlineSource.insertTodo(task);
      // AppRouter.back();
    }
  }

  Future<void> syncWithFirebase(List<Todo> todos) async {
    try {
      final todoRef = _database;

      for (final todo in todos) {
        final newTodoRef = todoRef.push();
        await newTodoRef.set(todo.toJson());
      }
      print('Todos inserted successfully!');
      await _offlineSource.deleteAllTodos();
      Prompts.showSnackBar("Database synced successfully!");
    } catch (e) {
      print('Todos Insertion Failed!');
      print(e);
    }
  }

  // Read
  Future<List<Todo>> getTodos() async {
    appPrint("Fetching Todos...");
    List<Todo> todo;
    try {
      todo = await _database.get().then((event) {
        final data = event.value as Map<dynamic, dynamic>;
        if (data == null) return [];
        final todos = data.entries.map((entry) => Todo(
          id: entry.key as String,
          title: entry.value['title'] as String,
          description: entry.value['description'] as String,
          status: entry.value['status'] as String,
        )).toList();
        return todos;
      });
      return todo;
    } on FirebaseException catch (e) {
      appPrint("Exception $e");
      todo = await _offlineSource.getTodos();
      appPrint("Offline: ${todo.toList()}");
    }
    return todo;
  }

  // Update
  Future<void> updateTodo(String id, Todo task) async {
    try {
      await _database.child(id).update({
        "id": id,
        "title": task.title,
        "description": task.description,
        "status": task.status,
      });
      print('Todo updated with ID: $id');
    } on FirebaseException catch (e) {
      print('Error updating todo: $e');
    }
  }

  // Delete
  Future<void> deleteTodo(id) async {
    try {
      await _database.child(id).remove();
      print('Todo deleted with ID: $id');
    } on FirebaseException catch (e) {
      print('Error deleting todo: $e');
    } catch (e) {
      appPrint("Error deleting... $e");
      await _offlineSource.deleteTodo(id);
    }
  }

  Future<void> deleteTodos(List<Todo> todos) async {
    final todoRef = _database;

    for (final todo in todos) {
      final todoKey = todo.id;
      if (todoKey != null) {
        await todoRef.child(todoKey).remove();
      } else {
        print('Error: Todo missing ID for deletion.');
      }
    }

    print('Todos deleted successfully!');
  }
}
