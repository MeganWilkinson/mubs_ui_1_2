import 'package:flutter/material.dart';
import 'package:mubs_ui_1_2/todoItem.dart';

import 'package:mubs_ui_1_2/todoTile.dart';
import 'package:mubs_ui_1_2/todoListScreen.dart';

var todoListEx = <TodoItem>[
  TodoItem(category: 'other', title: 'make breakfast', difficulty: 3),
  TodoItem(category: 'practical', title: 'shower', difficulty: 2),
  TodoItem(category: 'practical', title: 'clean kitchen', difficulty: 2),
  TodoItem(category: 'practical', title: 'make dentist appointment', difficulty: 3),
  TodoItem(category: 'Sparetime', title: 'make cup of tea', difficulty: 1),
  TodoItem(category: 'social', title: 'call Bob', difficulty: 3),
  TodoItem(category: 'other', title: 'brush teeth', difficulty: 1),
  TodoItem(category: 'movement', title: 'go for a jog', difficulty: 2),
  TodoItem(category: 'sparetime', title: 'read book', difficulty: 1),
  TodoItem(category: 'social', title: 'make dinner plans with friends', difficulty: 3),
  TodoItem(category: 'daily living', title: 'get groceries for the week', difficulty: 2),
  TodoItem(category: 'work & edu', title: 'write meeting report', difficulty: 3),
  TodoItem(category: 'movement', title: 'template', difficulty: 1),
  TodoItem(category: 'work & edu', title: 'template', difficulty: 1),
  TodoItem(category: 'sparetime', title: 'template', difficulty: 1),
  TodoItem(category: 'daily living', title: 'template', difficulty: 1),
  TodoItem(category: 'practical', title: 'template', difficulty: 1),
];

void main() {
  runApp(new MubsUI12App());
}


class MubsUI12App extends StatelessWidget { // MUBS User Interface v1.2 App
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todos',
      home: Center(
        child: TodoListScreen(),
      ),
    );
  }
}
