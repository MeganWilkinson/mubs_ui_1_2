import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class TodoItem {
  final String category;
  String title;
  int difficulty; // TODO: change to an enum but for now difficulties ∈ {1,2,3}, easy > hard
  bool completed;

  TodoItem({
    @required this.category,
    @required this.title,
    @required this.difficulty,
    this.completed = false,
  })  : assert(category != null && category.isNotEmpty),
      assert(title != null && title.isNotEmpty),
      assert(difficulty != null),
      assert(completed != null);

//  imageKey = 'assets/' + this.id.toLowerCase() + '.png';
//
//  switch (difficulty) {
//  case 1:
//  points = 1;
//  difficultyIcon = Icons.sentiment_satisfied;
//  break;
//  case 2:
//  points = 5;
//  difficultyIcon = Icons.sentiment_neutral;
//  break;
//  case 3:
//  points = 10;
//  difficultyIcon = Icons.sentiment_dissatisfied; // TODO: change icons to something custom (Nobody likes unhappy faces!)
//  break;
//  default:
//  points = 20;
//  difficultyIcon = Icons.block;
//  }

  TodoItem.fromMap(Map<String, dynamic> data)
    : this(category: data['id'], title: data['title'], difficulty: data['difficulty'], completed: data['completed'] ?? false);

  Map<String, dynamic> toMap() => {
    'id': this.category,
    'title': this.title,
    'difficulty': this.difficulty,
    'completed': this.completed,
  };
}