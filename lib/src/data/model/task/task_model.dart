import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
class TaskModel with _$TaskModel{
  const factory TaskModel(
    String taskId,
    String title,
    String? memo,
    int priority,
    bool done,
    bool archived,
    DateTime createdAt,
    DateTime updatedAt,
  ) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) => _$TaskModelFromJson(json);
}
