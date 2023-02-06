import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../../Models/task_model.dart';
part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTask>(_addTaskEvent);
    on<UpdateTask>(_updateTaskEvent);
    on<DeleteTask>(_deleteTaskEvent);
    on<RemoveTask>(_removeTaskEvent);
  }

  void _addTaskEvent(AddTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
        pendingTasks: List.from(state.pendingTasks)..add(event.task),
        completedTasks: state.completedTasks,
        favoriteTasks: state.favoriteTasks,
        removedTask: state.removedTask));
  }

  void _updateTaskEvent(UpdateTask event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;

    List<Task> pendingTasks = state.pendingTasks;
    List<Task> completedTasks = state.completedTasks;
    task.isDone == false
        ? {
            pendingTasks = List.from(pendingTasks)..remove(task),
            completedTasks = List.from(completedTasks)
              ..insert(0, task.copyWith(isDone: true))
          }
        : {
            completedTasks = List.from(completedTasks)..remove(task),
            pendingTasks = List.from(pendingTasks)
              ..insert(0, task.copyWith(isDone: false))
          };

    emit(TaskState(
        pendingTasks: pendingTasks,
        removedTask: state.removedTask,
        completedTasks: completedTasks,
        favoriteTasks: state.favoriteTasks));
  }

  void _deleteTaskEvent(DeleteTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
        pendingTasks: List.from(state.pendingTasks)..remove(event.task),
        completedTasks: state.completedTasks,
        favoriteTasks: state.favoriteTasks,
        removedTask: List.from(state.removedTask)..remove(event.task)));
    print('removed task list length---->${state.removedTask.length}');
  }

  void _removeTaskEvent(RemoveTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
        pendingTasks: List.from(state.pendingTasks)..add(event.task.copyWith(isDeleted: true)),
        completedTasks: List.from(state.completedTasks)..remove(event.task),
        favoriteTasks: List.from(state.favoriteTasks)..remove(event.task),
        removedTask: List.from(state.removedTask)
          ..add(event.task.copyWith(isDeleted: true))));

  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    return TaskState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return state.toMap();
  }
}
