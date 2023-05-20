import 'package:freezed_annotation/freezed_annotation.dart';

part 'courseModel.freezed.dart';
part 'courseModel.g.dart';

@freezed
class CourseModel with _$CourseModel {
  factory CourseModel({
    required String name,
    required String englishName,
    required int credit,
    required String type,
    required int design,
    required String detail,
    required String semester,
  }) = _CourseModel;

  factory CourseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseModelFromJson(json);
}
