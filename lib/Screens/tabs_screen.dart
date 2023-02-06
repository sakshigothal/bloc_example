import 'package:bloc_example/Screens/completed_task_screen.dart';
import 'package:bloc_example/Screens/drawer_widget.dart';
import 'package:bloc_example/Screens/favorite_task_screen.dart';
import 'package:bloc_example/Screens/pending_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Blocs/TaskBloc/task_bloc.dart';
import '../Models/task_model.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);
  static const id = 'tabs_screen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  TextEditingController taskController = TextEditingController();
  final List<Map<String,dynamic>> pageDetails = [
    {'pageName' : PendingTaskScreen(),'title': 'Pending Task'},
    {'pageName' : CompletedTaskScreen(),'title': 'Completed Task'},
    {'pageName' : FavoriteTaskScreen(),'title': 'Favorite Task'},
  ];
  var selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${pageDetails[selectedPageIndex]['title']}'),),
      drawer: DrawerWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTaskSheet(context);
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPageIndex,
        onTap: (index){
          setState(() {
            selectedPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list),label: 'Pending Task'),
          BottomNavigationBarItem(icon: Icon(Icons.check),label: 'Completed Task'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorite Task')
        ],
      ),
      body: pageDetails[selectedPageIndex]['pageName'],
    );
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

