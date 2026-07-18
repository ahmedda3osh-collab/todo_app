

import 'package:flutter/material.dart';
import 'package:todo_app/features/widgets/task_item.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated
      (itemBuilder: (context,index)=>TaskItem(),
      separatorBuilder:(context,index)=>SizedBox(height: 12),
         itemCount: 4),
    );
  }
}