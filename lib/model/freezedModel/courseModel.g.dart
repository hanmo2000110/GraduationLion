// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../courseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CourseModel _$$_CourseModelFromJson(Map<String, dynamic> json) =>
    _$_CourseModel(
      name: json['name'] as String,
      englishName: json['englishName'] as String,
      credit: json['credit'] as int,
      type: json['type'] as String,
      design: json['design'] as int,
      detail: json['detail'] as String,
      semester: json['semester'] as String,
      gradeOrPf: json['gradeOrPf'] as String,
    );

Map<String, dynamic> _$$_CourseModelToJson(_$_CourseModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'englishName': instance.englishName,
      'credit': instance.credit,
      'type': instance.type,
      'design': instance.design,
      'detail': instance.detail,
      'semester': instance.semester,
      'gradeOrPf': instance.gradeOrPf,
    };
