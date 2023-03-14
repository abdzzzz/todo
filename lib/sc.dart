import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:to_do_app/task_model.dart';

class Screen extends StatefulWidget {
  const Screen({super.key, required this.taskModel});
  final ToDo taskModel;
  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.taskModel.titel,
        style: const TextStyle(color: Colors.white),

        ),
      ),
body: Center(child: Column(
  
  mainAxisAlignment: MainAxisAlignment.center,
  children: [

Text(widget.taskModel.subtitel??'',
style: const TextStyle(fontSize: 18),
textAlign: TextAlign.center,
),
Icon(
widget.taskModel.isdone? Icons.check: Icons.close,
color: widget.taskModel.isdone ? Colors.green : Colors.red,
size: 200,
),
Text("This task added at : ${widget.taskModel.dt.toString().substring(0,10).replaceAll('-', '/')
}")

  ]
  
  
  ,)),
    );
  }
}
