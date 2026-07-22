

import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_text_style.dart';
import 'package:todo_app/features/add_task/models/task_model.dart';

class TaskItem extends StatelessWidget {
  final TaskModel task;
  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(20),
      ),
      elevation: 2,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 30,
              decoration: BoxDecoration(
                color: Color(task.color),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
         SizedBox(width: 15),
          Expanded(child: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(task.title,style: 
              AppTextStyle.headLineStyle.copyWith(color: Colors.black),),
              Text(task.description,style:
              AppTextStyle.subTitleStyle.copyWith(color: Colors.black),),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16,vertical:8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color(task.color).withValues(alpha: 0.4)
                ),
                child: Text(task.status,style:
                 AppTextStyle.headLineStyle.copyWith(color:Color(task.color)),
              ),
              )
            ],
          )),
         Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}