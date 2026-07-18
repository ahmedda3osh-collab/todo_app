

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/core/theme/app_text_style.dart';
import 'package:todo_app/core/utils/app_constant.dart';
import 'package:todo_app/features/auth/data/models/user_model.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
      var userData = Hive.box<UserModel>(AppConstant.userBox).getAt(0);

    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: Image.file(File(userData?.image??"")).image,
          
        ),
        SizedBox(width: 12,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Good morning 🖐",style:AppTextStyle.subTitleStyle),
              Text(userData?.name??"",style:AppTextStyle.headLineStyle),
            ],
          ),
        ),
        Icon(Icons.notifications_none_outlined,size: 30,),
      ],
    );
  }
}