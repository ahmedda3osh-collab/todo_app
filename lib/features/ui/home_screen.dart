

import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_text_style.dart';
import 'package:todo_app/features/widgets/home_app_bar.dart';
import 'package:todo_app/features/widgets/main_card.dart';
import 'package:todo_app/features/widgets/tasks_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
        onPressed: (){},
        label: Row(
          children: [Icon(Icons.add),
          Text("Task")],
          
        )
      ),
    );
  }
  
}