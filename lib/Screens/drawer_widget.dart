import 'package:bloc_example/Blocs/switchBloc/switch_bloc.dart';
import 'package:bloc_example/Screens/recyclebin_screen.dart';
import 'package:bloc_example/Screens/pending_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Blocs/TaskBloc/task_bloc.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        // color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 50.0,
              color: Colors.blueGrey,
              child: const Center(
                child: Text('Task Manager'),
              ),
            ),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(PendingTaskScreen.id);
                  },
                  child: ListTile(
                    leading: const Icon(Icons.folder_sharp),
                    title: const Text('My Tasks'),
                    trailing: Text(state.pendingTasks.length.toString()),
                  ),
                );
              },
            ),
            const Divider(),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(RecycleBinScreen.id);
                  },
                  child: ListTile(
                    leading: const Icon(Icons.delete),
                    title: const Text('Bin'),
                    trailing: Text(state.removedTask.length.toString()),
                  ),
                );
              },
            ),
            const Divider(),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return ListTile(
                  title: const Text('Change App Theme'),
                  trailing: Switch(
                      value: state.switchValue,
                      onChanged: (value) {
                        value
                            ? context.read<SwitchBloc>().add(SwitchOnEvent())
                            : context.read<SwitchBloc>().add(SwitchOffEvent());
                      }),
                );
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
