import 'package:flutter/material.dart';
import 'todoListScreen.dart';
import 'todoItem.dart';
import 'package:mubs_ui_1_2/ActivityInfo.dart';

/// POSSIBLE CHANGES:
///   - no category icon. Use color coding for simplicity
///
/// TO ADD:
///   - point system? level(difficulty) icon/color-coding?

final _minRowHeight = 40.0;
final _borderRadius = BorderRadius.circular(_minRowHeight / 8);

/// A [TodoItem] widget.
/// The widget is composed of an [Icon] and [Text]. Tapping on a widget shows a
/// colored [InkWell] animation and changes the components of a [TodoItem] to be
/// completed or incomplete.
class TodoTile extends StatefulWidget {
  final TodoItem todoItem;

  TodoTile({
    Key key,
    this.todoItem,
    }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  Widget categoryIconSection;
  int points;
  String difficultyAsset;

  @override
  void initState() {
    super.initState();

    categoryIconSection = Container(
      padding: const EdgeInsets.all(4.0),
      color: Colors.transparent,
      child: Container(
        width: 15.0,
        height: 15.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ActivityInfo.getColor(widget.todoItem.category),
        ),
      )
    );

    difficultyAsset = 'assets/level${widget.todoItem.difficulty}.png';
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.todoItem.completed ? Colors.grey : Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
              minHeight: _minRowHeight,
            ),
            child: Container(
              child: InkWell(
                //borderRadius: _borderRadius,
                highlightColor: widget.todoItem.completed ? Colors.grey[300] : Colors.grey[700],
                splashColor: widget.todoItem.completed ? Colors.grey[300] : Colors.grey[700],
                onTap: () {
                  _toggleCompleted();
                },
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: categoryIconSection,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: Text(
                          widget.todoItem.title,
                        ),
                      ),
                      Center(
                        child: Image.asset(
                          difficultyAsset,
                          width: 30.0,
                          height: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Divider(
            height: 0.0,
          )
        ],
      ),
    );
  }

  void _toggleCompleted() {
    setState(() {
      if (widget.todoItem.completed) {
        widget.todoItem.completed = false;
      } else {
        widget.todoItem.completed = true;
      }
    });
  }
}
