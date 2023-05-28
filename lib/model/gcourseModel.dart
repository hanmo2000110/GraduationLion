import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezedModel/gcourseModel.freezed.dart';
part 'freezedModel/gcourseModel.g.dart';

@freezed
class GCourseModel with _$GCourseModel {
  factory GCourseModel({
    required String name,
    required double credit,
    required String type,
    required String detail,
    required String gradeOrPf,
    required String category,
  }) = _GCourseModel;

  factory GCourseModel.fromJson(Map<String, dynamic> json) =>
      _$GCourseModelFromJson(json);
}
