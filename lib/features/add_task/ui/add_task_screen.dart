import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/theme/app_text_style.dart';
import 'package:todo_app/core/utils/app_constant.dart';
import 'package:todo_app/core/widgets/app_button.dart';
import 'package:todo_app/core/widgets/custom_text_field.dart';
import 'package:todo_app/features/add_task/models/task_model.dart';
import 'package:todo_app/features/add_task/widget/task_color_list_view.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var dateController = TextEditingController();
  int? color;
    @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Task"), backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  controller: titleController,
                  title: "Task Title",
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "Task title is required";
                    }
                    return null;
                  },
                  hintText: "Enter your title",
                ),
                SizedBox(height: 20),
                CustomTextField(
                  controller: descriptionController,
                  title: "Description",
                  hintText: "Enter your Description",
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "Task description is required";
                    }
                    return null;
                  },
                  maxLines: 5,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  controller: dateController,
                  title: "Task Date",
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "Task Date is required";
                    }
                    return null;
                  },
                  readOnly: true,
                  onTap: () {
                    showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2027),
                    ).then((v) {
                      dateController.text = DateFormat.yMMMd().format(
                        v ?? DateTime.now(),
                      );
                    });
                  },
                ),
                SizedBox(height: 20),
                Text("Choose Color", style: AppTextStyle.headLineStyle),
                TaskColorListView(onValue: (c){
                 color=c?.toARGB32();
                },),
                SizedBox(height: 20),
                AppButton(
                  title: "Save Task",
                  onTap: () {
                    if(color==null){
                      showDialog(context: context,
                       builder:(context)=> AlertDialog(
                        title: Text("Error"),
                        content: Text("Please select a color"),
                       ),
                       );
                       return;
                    }
                    if(formKey.currentState?.validate()??false){
                     Hive.box<TaskModel>(AppConstant.taskBox).add(
                      TaskModel(title: titleController.text, 
                      color: color!,
                       date: dateController.text,
                        description: descriptionController.text)
                        ).then((v){
                          Navigator.pop(context);
                        });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
