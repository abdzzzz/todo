import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:to_do_app/task_model.dart';
// ignore: unused_import
import 'sc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();

  List<ToDo> task = [];
  List<ToDo> taskD = [];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("ALZENTANI"),
            bottom: const TabBar(
              tabs: [
                Tab(
                  child: Text("A"),
                ),
                Tab(
                  child: Text("B"),
                ),
              ],
              labelColor: Colors.black,
            ),
          ),
          body: TabBarView(
            children: [
              ListView.builder(
                itemCount: task.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => Screen(
                                    taskModel: task[index],
                                  )));
                    },
                    child: ListTile(
                      title: Text(task[index].titel),
                      subtitle: Text(task[index]
                          .dt
                          .toString()
                          .substring(0, 10)
                          .replaceAll('-', '/')),
                      trailing: Checkbox(
                          value: task[index].isdone,
                          onChanged: (value) {
                            setState(() {
                              task[index].isdone = !task[index].isdone;
                              taskD.add(task[index]);

                              task.removeAt(index);
                            });
                          }),
                    ),
                  );
                },
              ),
              ListView.builder(
                itemCount: taskD.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => Screen(
                                    taskModel: taskD[index],
                                  )));
                    },
                    child: ListTile(
                      title: Text(taskD[index].titel),
                      subtitle: Text(taskD[index]
                          .dt
                          .toString()
                          .substring(0, 10)
                          .replaceAll('-', '/')),
                      trailing: Checkbox(
                          value: taskD[index].isdone,
                          onChanged: (value) {
                            setState(() {
                              taskD[index].isdone = !taskD[index].isdone;
                              task.add(taskD[index]);
                  
                              taskD.removeAt(index);
                            });
                          }),
                    ),
                  );
                },
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        child: Container(
                          width: 50,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    controller: titleController,
                                    decoration: InputDecoration(
                                      hintText: "enter task",
                                      hintStyle: TextStyle(
                                          color: Colors.green.withOpacity(0.6)),
                                    ),
                                  ),
                                  TextField(
                                    controller: subtitleController,
                                    decoration: InputDecoration(
                                        hintText: 'enter task',
                                        hintStyle: TextStyle(
                                          color: Colors.green.withOpacity(0.6),
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      MaterialButton(
                                        onPressed: () {
                                          if (titleController.text.isNotEmpty) {
                                            task.add(ToDo(
                                                titel: titleController.text,
                                                subtitel: subtitleController
                                                        .text.isEmpty
                                                    ? null
                                                    : subtitleController.text,
                                                dt: DateTime.now()));
                                          }
                                          titleController.clear();
                                          subtitleController.clear();
                                          Navigator.pop(context);
                                          setState(() {});
                                        },
                                        color: Colors.green,
                                        child: Row(children: const [
                                          Text(
                                            'ADD',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Icon(Icons.add)
                                        ]),
                                      ),
                                      MaterialButton(
                                          onPressed: () {
                                            titleController.clear();
                                            subtitleController.clear();
                                            Navigator.pop(context);
                                          },
                                          color: Colors.green,
                                          child: const Text(
                                            'Cancel',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ))
                                    ],
                                  )
                                ]),
                          ),
                        ),
                      );
                    });
              })),
    );
  }
}
