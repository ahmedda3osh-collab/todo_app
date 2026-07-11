

import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_color.dart';
import 'package:todo_app/core/theme/app_text_style.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color : AppColor.primaryColor,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Text("countinue",
      style: AppTextStyle.headLineStyle.copyWith(
        color: Colors.white),),
    );
  }
}