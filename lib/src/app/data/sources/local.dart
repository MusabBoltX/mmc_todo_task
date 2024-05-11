import 'package:mmc_task/src/app/data/models/todo_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class OfflineSource {
  static const _databaseName = "todos.db";
  static const _databaseVersion = 1;

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final fullPath = path.join(databasePath, _databaseName);
    return await openDatabase(fullPath, version: _databaseVersion,
        onCreate: (db, version) {
      db.execute(
          "CREATE TABLE todos (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, status TEXT)");
    });
  }

  // CRUD operations

  // Create
  Future<void> insertTodo(Todo task, {bool? offline}) async {
    final db = await database;
    await db.insert('todos', {
      "offline": offline ?? false,
      "title": task.title,
      "description": task.description,
      "status": task.status,
    });
  }

  // Read
  Future<List<Todo>> getTodos() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('todos');
    return List.generate(maps.length, (i) => Todo.fromJson(maps[i]));
  }

  // Update
  Future<void> updateTodo(Todo todo, {bool? offline}) async {
    final db = await database;
    await db.update('todos', todo.toJson(), where: 'id = ?', whereArgs: [todo.id]);
  }

  // Delete
  Future<void> deleteTodo(int id) async {
    final db = await database;
    await db.delete('todos', where: 'id = ?', whereArgs: [id]);
  }
}
