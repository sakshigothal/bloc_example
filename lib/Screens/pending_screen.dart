import 'package:bloc_example/Blocs/TaskBloc/task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Models/task_model.dart';
import 'drawer_widget.dart';

class PendingTaskScreen extends StatelessWidget {
  PendingTaskScreen({Key? key}) : super(key: key);
  TextEditingController taskController = TextEditingController();
  static const id = 'task_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> tasksList = state.pendingTasks;
        return SafeArea(
          child: Scaffold(
              body: Column(
                children: [
                   Center(
                    child: Chip(label: Text('Tasks: ${tasksList.length.toString()}')),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: tasksList.length,
                      itemBuilder: (ctx, index) {
                        var task = tasksList[index];
                        return ListTile(
                          title: Text(tasksList[index].title),
                          trailing: Checkbox(
                              value: tasksList[index].isDone,
                              onChanged: task.isDeleted == false ? (value) {
                                context.read<TaskBloc>().add(UpdateTask(task: task));
                              } : null),
                          onLongPress: (){
                            checkDeleteTask(context,task);
                            Fluttertoast.showToast(
                                msg: 'Task Deleted Successfully',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                // backgroundColor: Colors.red,
                                textColor: Colors.white
                            );
                          },
                        );
                      }),
                ],
              )),
        );
      },
    );
  }

  void checkDeleteTask(BuildContext ctx, Task task){
    task.isDeleted! ? ctx.read<TaskBloc>().add(DeleteTask(task: task)) :
    ctx.read<TaskBloc>().add(RemoveTask(task: task));
  }

  void addTaskSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              child: Column(
                children: [
                  Text('Add Task'),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: taskController,
                    decoration: const InputDecoration(
                        label: Text('Title'), border: OutlineInputBorder()),
                  ),
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel')),
                  ElevatedButton(
                      onPressed: () {
                        var task = Task(title: taskController.text);
                        context.read<TaskBloc>().add(AddTask(task: task));
                        taskController.clear();
                        Navigator.pop(context);
                      },
                      child: const Text('Add'))
                ],
              ),
            ),
          );
        });
  }
}
