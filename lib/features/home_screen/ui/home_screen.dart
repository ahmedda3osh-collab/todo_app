

import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_text_style.dart';
import 'package:todo_app/features/add_task/ui/add_task_screen.dart';
import 'package:todo_app/features/home_screen/widget/home_app_bar.dart';
import 'package:todo_app/features/home_screen/widget/main_card.dart';
import 'package:todo_app/features/home_screen/widget/tasks_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             HomeAppBar(),
              SizedBox(height: 20,),
                MainCard(),
                SizedBox(height: 20,),
                Text("Today's Task",style:
                 AppTextStyle.mainTitleStyle.copyWith(color: Colors.black),
                 ),
                 SizedBox(height: 12),
                 TasksList()
            ],
            ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()async{
         await Navigator.push(context, MaterialPageRoute(builder: (context)=>
          AddTaskScreen()
          ),
          );
          setState(() {
            
          });
        },
        label: Row(
          children: [Icon(Icons.add),
          Text("Task")],
          
        )
      ),
    );
  }
}