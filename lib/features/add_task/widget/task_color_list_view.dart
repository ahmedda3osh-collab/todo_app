

import 'package:flutter/material.dart';

class TaskColorListView extends StatefulWidget {
  final Function(Color?) onValue;
  const TaskColorListView({super.key, required this.onValue});

  @override
  State<TaskColorListView> createState() => _TaskColorListViewState();
}

class _TaskColorListViewState extends State<TaskColorListView> {
  List<MaterialColor>taskColor=[
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.amber,
    Colors.grey
  ];
  int activeIndex=-1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index)=>InkWell(
          onTap: () {
            setState(() {
              activeIndex=index;
              widget.onValue(taskColor[index]);
            });
          },
          child:CircleAvatar(
        radius: 33,
        backgroundColor:taskColor[index],
        child:activeIndex==index?Center(
          child: Icon(Icons.check),
          ):null
      ), 
        ),
                
       separatorBuilder: (context,index)=>SizedBox(width: 10),
        itemCount: taskColor.length),
    );
  }
}