import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String title;
  bool? isDone;
  bool? isDeleted;

  Task({required this.title, this.isDone, this.isDeleted}) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  Task copyWith({String? title, bool? isDone, bool? isDeleted}) {
    return Task(
        title: title ?? this.title,
        isDone: isDone ?? this.isDone,
        isDeleted: isDeleted ?? this.isDone);
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "isDone": isDone,
      "isDeleted": isDeleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> json) {
    return Task(
      title: json["title"] ?? '',
      isDone: json["isDone"],
      isDeleted: json["isDeleted"],
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [title, isDone, isDeleted];
}
