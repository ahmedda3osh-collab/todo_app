

import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_text_style.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller ;
  const CustomTextField({super.key,  this.controller });

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
            controller: controller,
            onTapOutside: (v){
              FocusScope.of(context).unfocus();
            },
            validator:(v){
              if(v==null || v.isEmpty){
                return "Please enter your name";
              }else if(v.length<3){
                return "Name must be at least 3 characters";
              }
              return null;

            },
            decoration: InputDecoration(
              fillColor: Colors.grey.shade300,
              filled: true,
              hintText: "Enter your name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none
              ),
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