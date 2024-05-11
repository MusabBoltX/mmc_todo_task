import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mmc_task/src/app/data/models/todo_model.dart';
import 'package:mmc_task/src/app/data/sources/local.dart';
import 'package:mmc_task/src/core/utils/app_logger.dart';

class NetworkSource {
  final _database = FirebaseDatabase.instance.ref().child('todos');
  final OfflineSource _offlineSource = OfflineSource();

  // Create
  Future<void> createTodo(Todo task) async {
    try {
      final ref = _database.push();
      await ref.set({
        "id": ref.key,
        "title": task.title,
        "description": task.description,
        "status": task.status,
      });
      // await _offlineSource.insertTodo(task);
      print('Todo created with ID: ${ref.key}');
    } on FirebaseException catch (e) {
      print('Error creating todo: $e');
    } on SocketException {
      await _offlineSource.insertTodo(task, offline: true);
    }
  }

  // Read
  Stream<List<Todo>> getTodos() {
    Stream<List<Todo>> todo;
    try {
      todo = _database.onValue.map((event) {
        final data = event.snapshot.value as Map<dynamic, dynamic>;
        if (data == null) return [];
        final todos = data.entries.map((entry) => Todo(
          id: entry.key as String,
          title: entry.value['title'] as String,
          description: entry.value['description'] as String,
          status: entry.value['status'] as String,
        )).toList();
        appPrint("todos.first.title: ${todos.first.title}");
        return todos;
      });
      return todo;
    } on SocketException {
      todo = _offlineSource.getTodos().asStream();
      appPrint("Offline: ${todo.toList()}");
    } catch (e) {
      todo = _offlineSource.getTodos().asStream();
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
  Future<void> deleteTodo(String id) async {
    try {
      await _database.child(id).remove();
      print('Todo deleted with ID: $id');
    } on FirebaseException catch (e) {
      print('Error deleting todo: $e');
    }
  }
}
