

import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_color.dart';
import 'package:todo_app/core/theme/app_text_style.dart';

class AppButton extends StatelessWidget {
  final void Function()? onTap;
  final String title;

  const AppButton( {super.key,  this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color : AppColor.primaryColor,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Text(title,
        style: AppTextStyle.headLineStyle.copyWith(
          color: Colors.white),),
      ),
    );
  }
}