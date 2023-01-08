import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListTileWidget extends StatelessWidget {
  final List taskList;

  final void Function(BuildContext context) deleteFunction;
  final void Function(bool?)? onChanged;

  const ListTileWidget({
    super.key,
    required this.taskList,
    required this.deleteFunction,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.only(right: 20),
      child: Slidable(
        key: UniqueKey(),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(25)),
          ),
          child: CheckboxListTile(
            value: taskList[1],
            checkColor: Colors.white,
            activeColor: Colors.purple,
            title: Text(
              taskList[0],
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                decoration: taskList[1]
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
