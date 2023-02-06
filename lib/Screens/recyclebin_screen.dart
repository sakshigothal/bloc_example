import 'package:bloc_example/Blocs/TaskBloc/task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Models/task_model.dart';
import 'drawer_widget.dart';

class RecycleBinScreen extends StatelessWidget {
  const RecycleBinScreen({Key? key}) : super(key: key);
  static const id = 'recycle_bin_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> removedTaskList = state.removedTask;
        return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                title: const Text('Recycle Bin'),
                backgroundColor: Colors.blueGrey,
                actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
              ),
              body: Column(
                children: [
                  Center(
                    child: Chip(label: Text('Tasks : ${state.removedTask.length}')),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: removedTaskList.length,
                      itemBuilder: (ctx, index) {
                        var task = removedTaskList[index];
                        return ListTile(
                          title: Text(task.title),
                          trailing: Checkbox(
                              value: task.isDone,
                              onChanged: (value) {
                                context.read<TaskBloc>().add(UpdateTask(task: task));
                              }),
                          onLongPress: () {
                            context.read<TaskBloc>().add(DeleteTask(task: task));
                          },
                        );
                      }),
                ],
              )),
        );
      },
    );
  }
}
