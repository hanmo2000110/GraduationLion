// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gcourseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GCourseModel _$$_GCourseModelFromJson(Map<String, dynamic> json) =>
    _$_GCourseModel(
      name: json['name'] as String,
      credit: (json['credit'] as num).toDouble(),
      type: json['type'] as String,
      detail: json['detail'] as String,
      gradeOrPf: json['gradeOrPf'] as String,
      category: json['category'] as String,
    );

Map<String, dynamic> _$$_GCourseModelToJson(_$_GCourseModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'credit': instance.credit,
      'type': instance.type,
      'detail': instance.detail,
      'gradeOrPf': instance.gradeOrPf,
      'category': instance.category,
    };
