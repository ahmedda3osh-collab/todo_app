

import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_text_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Full name",
          style: AppTextStyle.headLineStyle,
          ),
          SizedBox(height: 10,),
          TextFormField(
            onTapOutside: (v){
              FocusScope.of(context).unfocus();
            },
            decoration: InputDecoration(
              fillColor: Colors.grey.shade300,
              filled: true,
              hintText: "Enter your name",
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none
              ),
            ),
          )

      ],
    );
  }
}