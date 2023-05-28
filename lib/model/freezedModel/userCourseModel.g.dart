// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../userCourseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserCourseModel _$$_UserCourseModelFromJson(Map<String, dynamic> json) =>
    _$_UserCourseModel(
      name: json['name'] as String,
      credit: (json['credit'] as num).toDouble(),
      type: json['type'] as String,
      design: json['design'] as int?,
      semester: json['semester'] as String,
      gradeOrPf: json['gradeOrPf'] as String,
      isEnglish: json['isEnglish'] as bool,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$$_UserCourseModelToJson(_$_UserCourseModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'credit': instance.credit,
      'type': instance.type,
      'design': instance.design,
      'semester': instance.semester,
      'gradeOrPf': instance.gradeOrPf,
      'isEnglish': instance.isEnglish,
      'category': instance.category,
    };
