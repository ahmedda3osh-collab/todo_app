

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/core/utils/app_constant.dart';
import 'package:todo_app/features/add_task/models/task_model.dart';
import 'package:todo_app/features/auth/data/models/user_model.dart';
import 'package:todo_app/todo_app.dart';

void main()async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(TaskModelAdapter());
  
  await Hive.openBox<UserModel>(AppConstant.userBox);
  await Hive.openBox<TaskModel>(AppConstant.taskBox);

  WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark, 
  ));
  runApp(TodoApp());
}