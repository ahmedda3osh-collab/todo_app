

import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_text_style.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller ;
  final String title;
  final String? Function(String?)? validator;
  final String? hintText ;
  final int? maxLines;
  final bool? readOnly; 
  final void Function()? onTap;

  const CustomTextField({
    super.key, 
   this.controller,
    required this.title,
     this.validator,
       this.hintText,
       this.maxLines,
        this.readOnly, 
        this.onTap });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
          style: AppTextStyle.headLineStyle,
          ),
          SizedBox(height: 10,),
          TextFormField(
            maxLines :maxLines,
            readOnly: readOnly??false,
            onTap: onTap,
            controller: controller,
            onTapOutside: (v){
              FocusScope.of(context).unfocus();
            },
            validator:validator,
            decoration: InputDecoration(
              fillColor: Colors.grey.shade300,
              filled: true,
              hintText: hintText,
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