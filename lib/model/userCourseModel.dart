import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezedModel/userCourseModel.freezed.dart';
part 'freezedModel/userCourseModel.g.dart';

@freezed
class UserCourseModel with _$UserCourseModel {
  factory UserCourseModel({
    required String name,
    required double credit,
    required String type,
    int? design,
    required String semester,
    required String gradeOrPf,
    required bool isEnglish,
    String? category,
  }) = _UserCourseModel;

  factory UserCourseModel.fromJson(Map<String, dynamic> json) =>
      _$UserCourseModelFromJson(json);
}
