part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<Task> pendingTasks;
  final List<Task> completedTasks;
  final List<Task> favoriteTasks;
  final List<Task> removedTask;
  const TaskState(
      {
        this.pendingTasks = const <Task>[],
        this.completedTasks = const <Task>[],
        this.favoriteTasks = const <Task>[],
        this.removedTask = const <Task>[]});
  @override
  List<Object> get props => [pendingTasks, completedTasks ,favoriteTasks,removedTask];

  Map<String, dynamic> toMap() {
    return {
      "allTask": pendingTasks.map((x) => x.toMap()).toList(),
      "completedTasks": completedTasks.map((x) => x.toMap()).toList(),
      "favoriteTasks": favoriteTasks.map((x) => x.toMap()).toList(),
      "removedTask": removedTask.map((x) => x.toMap()).toList(),
    };
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
        pendingTasks: List<Task>.from(map['allTask']?.map((x) => Task.fromMap(x))),
        completedTasks: List<Task>.from(map['completedTasks']?.map((x) => Task.fromMap(x))),
        favoriteTasks: List<Task>.from(map['favoriteTasks']?.map((x) => Task.fromMap(x))),
        removedTask: List<Task>.from(map['removedTask']?.map((x) => Task.fromMap(x))));
  }
}
