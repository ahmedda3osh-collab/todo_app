

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/core/theme/app_text_style.dart';
import 'package:todo_app/core/widgets/app_button.dart';
import 'package:todo_app/core/widgets/custom_text_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final picker = ImagePicker();
    XFile? image;
  void pickFromGallery()async{
   image = await picker.pickImage(source: ImageSource.gallery);
   setState(() {
     
   });
  }
  void pickFromCamera()async{
    image = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 250,),
              InkWell(
                onTap: (){
                  showDialog(context: context, builder: (context){
                  return AlertDialog(
                    title: Text("Select option"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: (){
                                                      Navigator.pop(context);

                            pickFromCamera();
                          },
                          icon: Icon(Icons.camera),
                        ),
                        IconButton(
                          onPressed: (){
                                                      Navigator.pop(context);

                            pickFromGallery();
                          },
                          icon: Icon(Icons.photo_library),
                        )
                      ],
                    ),
                    );
                  }
                  );
                },
                child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey.shade300,
                child:image!=null?null: Icon(Icons.person, size: 60,),
                backgroundImage:image!=null? Image.file(File(image?.path??"")).image:null,
                ),
              ),
              SizedBox(height: 25,),
              Text("Create your profile", 
              style: AppTextStyle.mainTitleStyle
              ),
              SizedBox(height: 10,),
              Text("Add your name and profile picture",
              style: AppTextStyle.subTitleStyle
              ),
              SizedBox(height: 10),
              CustomTextField(),
              SizedBox(height: 20,),
              AppButton(),
            ],
          ),
        ),
      )
    );
  }
}