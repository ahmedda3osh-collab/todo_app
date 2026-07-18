

import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_color.dart';
import 'package:todo_app/core/theme/app_text_style.dart';

class MainCard extends StatelessWidget {
  
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:[
            MainItem( 
              title: "Tasks",
              number: 12,
            ),
            MainItem(
              title: "Done",
              number: 5,
            ),
            MainItem(
              title: "Pending",
              number: 7,
            ),
          ]
        ),
      ),
    );
  }
}
class MainItem extends StatelessWidget {
  final String title;
  final int number; 
  const MainItem({super.key, required this.title, required this.number});

  @override
  Widget build(BuildContext context) {
    return Column(
   children: [
     Text(number.toString(),style:
      AppTextStyle.headLineStyle.copyWith(color: Colors.white),
      ),
      SizedBox(height: 12,),
      Text(title,style:
      AppTextStyle.subTitleStyle.copyWith(color: Colors.white),
      ),
   ]
    );

     
     
    
    
  }
}