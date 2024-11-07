import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {
  const TodoList(
      {super.key,
      required this.taskname,
      required this.taskcomplete,
      required this.onChanged, required this.deleteFunction});
  final String taskname;
  final bool taskcomplete;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 0, left: 10, right: 10),
      child: Slidable(
        endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                onPressed: deleteFunction,
                icon:Icons.delete,
                borderRadius: BorderRadius.circular(20),
                backgroundColor: Colors.red.shade300,
              ),
            ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.deepPurple,
          ),
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Checkbox(
                value: taskcomplete,
                onChanged: onChanged,
                checkColor: Colors.black,
                activeColor: Colors.white,
                side: const BorderSide(
                  color: Colors.black,
                ),
              ),
              Text(
                taskname,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  decoration: taskcomplete
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
