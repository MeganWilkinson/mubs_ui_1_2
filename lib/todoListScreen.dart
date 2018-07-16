import 'package:flutter/material.dart';
import 'package:mubs_ui_1_2/createTodoDialog.dart';
import 'package:mubs_ui_1_2/main.dart';
import 'package:mubs_ui_1_2/todoTile.dart';
import 'package:mubs_ui_1_2/todoItem.dart';

/// POSSIBLE CHANGES:
///   -
///
/// TO ADD:
///   - A "today's summary" visualization
///   - ability to delete todos (preferably by swiping them off the screen
///
var activeTodos = <TodoTile>[];
var completedTodos = <TodoTile>[];

class TodoListScreen extends StatefulWidget {
  const TodoListScreen();

  @override
  State<StatefulWidget> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {



  @override
  void initState() {
    super.initState();

    // for testing purposes
    for (var todo in todoListEx) {
      activeTodos.add(TodoTile(todoItem: todo));
    }
  }

  Widget _buildTodoTileWidgets() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return activeTodos[index];
      },
      itemCount: activeTodos.length,
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      tooltip: 'Create a todo',
      backgroundColor: Colors.lightGreenAccent[700],
      child: Icon(
        Icons.add,
      ),
      onPressed: () async {
        TodoItem newTodo = await showDialog(
          context: context,
          builder: (context) {
            return CreateTodoDialog();
          }
        );
        if (newTodo != null) {
          setState(() {
            activeTodos.insert(0, TodoTile(todoItem: newTodo));
          });
        }
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    final todoList = Container(
      color: Colors.white,
      child: _buildTodoTileWidgets(),
    );

    final appBar = AppBar(
      elevation: 0.0,
      title: Text(
        'Todos'
      ),
      centerTitle: true,
      backgroundColor: Colors.lightGreenAccent[700],
    );

    // TODO: implement build
    return Scaffold(
      appBar: appBar,
      body: todoList,
      floatingActionButton: _buildFAB(),
    );
  }
}

