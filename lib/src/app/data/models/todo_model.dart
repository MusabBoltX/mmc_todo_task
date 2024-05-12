// To parse this JSON data, do
//
//     final todo = todoFromJson(jsonString);

import 'dart:convert';

Todo todoFromJson(String str) => Todo.fromJson(json.decode(str));

String todoToJson(Todo data) => json.encode(data.toJson());

class Todo {
  dynamic id;
  String? title;
  String? description;
  String? status;

  Todo({
    this.id,
    this.title,
    this.description,
    this.status,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "status": status,
  };
}
