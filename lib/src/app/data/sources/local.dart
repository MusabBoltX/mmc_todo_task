import 'package:mmc_task/src/app/data/models/todo_model.dart';
import 'package:mmc_task/src/core/utils/app_logger.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class OfflineSource {
  static const _databaseName = "tasks.db";
  static const _databaseVersion = 1;

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    appPrint("DB Created");
    return _database!;
  }

  _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final fullPath = path.join(databasePath, _databaseName);
    return await openDatabase(fullPath, version: _databaseVersion,
      onCreate: (db, version) async {
      db.execute("CREATE TABLE todos (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, status TEXT, offline INTEGER NOT NULL DEFAULT 0)");
    });
  }

  // CRUD operations

  // Create
  Future<void> insertTodo(Todo task, {bool? offline}) async {
    appPrint("Creating locally!");
    final db = await database;
    await db.insert('todos', {
      "offline": offline == true ? 1 : 0,
      "title": task.title,
      "description": task.description,
      "status": task.status,
    });
    appPrint("Successfully created locally!");
  }

  Future<void> insertTodos(List<Todo> todos) async {
    final db = await database;
    final batch = db.batch();
    for (final todo in todos) {

      batch.insert('todos', {
        "offline": 1,
        "title": todo.title,
        "description": todo.description,
        "status": todo.status,
      });
    }

    await batch.commit();
  }

  // Read
  Future<List<Todo>> getTodos() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('todos');
    return List.generate(maps.length, (i) => Todo.fromJson(maps[i] ?? {}));
  }

  Future<List<Todo>> getOfflineTodos() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'todos',
      where: 'offline = 0',
    );
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

  // Close db
  Future<void> delete() async {
    final db = await database;
    await db.close();
  }

  Future<void> deleteAllTodos() async {
    final db = await database;
    await db.delete('todos');
    print('All todos deleted successfully!');
  }
}
