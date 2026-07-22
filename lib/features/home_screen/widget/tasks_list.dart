

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/core/utils/app_constant.dart';
import 'package:todo_app/features/add_task/models/task_model.dart';
import 'package:todo_app/features/home_screen/widget/task_item.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    List<TaskModel>allTasks=Hive.box<TaskModel>(AppConstant.taskBox).values.toList();

    return allTasks.isEmpty?
     Lottie.asset("assets/icons/empty.json") :Expanded(
      child: ListView.separated
      (itemBuilder: (context,index)=>Dismissible(
        background: Container(
          width: double.infinity,
          height: 100,
          color: Colors.red,
        ),
        secondaryBackground:Container(
          width: double.infinity,
          height: 100,
          color: Colors.green,
        ), 
        onDismissed: (dismissDirection){
        if (dismissDirection==DismissDirection.startToEnd){
          Hive.box<TaskModel>(AppConstant.taskBox).deleteAt(index);
        }else{
          if(allTasks[index].status.toLowerCase()=="Pending"){
            var value=allTasks[index];
            value.status="Completed";
            Hive.box<TaskModel>(AppConstant.taskBox).putAt(index, value);
            setState(() {
              
            });
          }
        }
        },
        key: UniqueKey(),
        child: TaskItem(
          task: allTasks[index],
        ),
      ),
      separatorBuilder:(context,index)=>SizedBox(height: 12),
         itemCount: allTasks.length),
    );
  }
}