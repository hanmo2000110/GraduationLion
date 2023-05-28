// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../courseModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CourseModel _$CourseModelFromJson(Map<String, dynamic> json) {
  return _CourseModel.fromJson(json);
}

/// @nodoc
mixin _$CourseModel {
  String get name => throw _privateConstructorUsedError;
  String get englishName => throw _privateConstructorUsedError;
  int get credit => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get design => throw _privateConstructorUsedError;
  String get detail => throw _privateConstructorUsedError;
  String get semester => throw _privateConstructorUsedError;
  String get gradeOrPf => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseModelCopyWith<CourseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseModelCopyWith<$Res> {
  factory $CourseModelCopyWith(
          CourseModel value, $Res Function(CourseModel) then) =
      _$CourseModelCopyWithImpl<$Res, CourseModel>;
  @useResult
  $Res call(
      {String name,
      String englishName,
      int credit,
      String type,
      int design,
      String detail,
      String semester,
      String gradeOrPf});
}

/// @nodoc
class _$CourseModelCopyWithImpl<$Res, $Val extends CourseModel>
    implements $CourseModelCopyWith<$Res> {
  _$CourseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? englishName = null,
    Object? credit = null,
    Object? type = null,
    Object? design = null,
    Object? detail = null,
    Object? semester = null,
    Object? gradeOrPf = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      englishName: null == englishName
          ? _value.englishName
          : englishName // ignore: cast_nullable_to_non_nullable
              as String,
      credit: null == credit
          ? _value.credit
          : credit // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      design: null == design
          ? _value.design
          : design // ignore: cast_nullable_to_non_nullable
              as int,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      semester: null == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as String,
      gradeOrPf: null == gradeOrPf
          ? _value.gradeOrPf
          : gradeOrPf // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CourseModelCopyWith<$Res>
    implements $CourseModelCopyWith<$Res> {
  factory _$$_CourseModelCopyWith(
          _$_CourseModel value, $Res Function(_$_CourseModel) then) =
      __$$_CourseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String englishName,
      int credit,
      String type,
      int design,
      String detail,
      String semester,
      String gradeOrPf});
}

/// @nodoc
class __$$_CourseModelCopyWithImpl<$Res>
    extends _$CourseModelCopyWithImpl<$Res, _$_CourseModel>
    implements _$$_CourseModelCopyWith<$Res> {
  __$$_CourseModelCopyWithImpl(
      _$_CourseModel _value, $Res Function(_$_CourseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? englishName = null,
    Object? credit = null,
    Object? type = null,
    Object? design = null,
    Object? detail = null,
    Object? semester = null,
    Object? gradeOrPf = null,
  }) {
    return _then(_$_CourseModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      englishName: null == englishName
          ? _value.englishName
          : englishName // ignore: cast_nullable_to_non_nullable
              as String,
      credit: null == credit
          ? _value.credit
          : credit // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      design: null == design
          ? _value.design
          : design // ignore: cast_nullable_to_non_nullable
              as int,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      semester: null == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as String,
      gradeOrPf: null == gradeOrPf
          ? _value.gradeOrPf
          : gradeOrPf // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CourseModel implements _CourseModel {
  _$_CourseModel(
      {required this.name,
      required this.englishName,
      required this.credit,
      required this.type,
      required this.design,
      required this.detail,
      required this.semester,
      required this.gradeOrPf});

  factory _$_CourseModel.fromJson(Map<String, dynamic> json) =>
      _$$_CourseModelFromJson(json);

  @override
  final String name;
  @override
  final String englishName;
  @override
  final int credit;
  @override
  final String type;
  @override
  final int design;
  @override
  final String detail;
  @override
  final String semester;
  @override
  final String gradeOrPf;

  @override
  String toString() {
    return 'CourseModel(name: $name, englishName: $englishName, credit: $credit, type: $type, design: $design, detail: $detail, semester: $semester, gradeOrPf: $gradeOrPf)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CourseModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.englishName, englishName) ||
                other.englishName == englishName) &&
            (identical(other.credit, credit) || other.credit == credit) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.design, design) || other.design == design) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.semester, semester) ||
                other.semester == semester) &&
            (identical(other.gradeOrPf, gradeOrPf) ||
                other.gradeOrPf == gradeOrPf));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, englishName, credit, type,
      design, detail, semester, gradeOrPf);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CourseModelCopyWith<_$_CourseModel> get copyWith =>
      __$$_CourseModelCopyWithImpl<_$_CourseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CourseModelToJson(
      this,
    );
  }
}

abstract class _CourseModel implements CourseModel {
  factory _CourseModel(
      {required final String name,
      required final String englishName,
      required final int credit,
      required final String type,
      required final int design,
      required final String detail,
      required final String semester,
      required final String gradeOrPf}) = _$_CourseModel;

  factory _CourseModel.fromJson(Map<String, dynamic> json) =
      _$_CourseModel.fromJson;

  @override
  String get name;
  @override
  String get englishName;
  @override
  int get credit;
  @override
  String get type;
  @override
  int get design;
  @override
  String get detail;
  @override
  String get semester;
  @override
  String get gradeOrPf;
  @override
  @JsonKey(ignore: true)
  _$$_CourseModelCopyWith<_$_CourseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
