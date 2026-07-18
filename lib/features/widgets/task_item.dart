

import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_text_style.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

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
                color: Colors.blue,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
         SizedBox(width: 15),
          Expanded(child: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Flutter UI",style: 
              AppTextStyle.headLineStyle.copyWith(color: Colors.black),),
              Text("Build register screen",style:
              AppTextStyle.subTitleStyle.copyWith(color: Colors.black),),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16,vertical:8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.blue.shade100
                ),
                child: Text("Pending",style:
                 AppTextStyle.headLineStyle.copyWith(color: Colors.blue),
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