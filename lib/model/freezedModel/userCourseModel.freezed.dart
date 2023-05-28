// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../userCourseModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserCourseModel _$UserCourseModelFromJson(Map<String, dynamic> json) {
  return _UserCourseModel.fromJson(json);
}

/// @nodoc
mixin _$UserCourseModel {
  String get name => throw _privateConstructorUsedError;
  double get credit => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int? get design => throw _privateConstructorUsedError;
  String get semester => throw _privateConstructorUsedError;
  String get gradeOrPf => throw _privateConstructorUsedError;
  bool get isEnglish => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCourseModelCopyWith<UserCourseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCourseModelCopyWith<$Res> {
  factory $UserCourseModelCopyWith(
          UserCourseModel value, $Res Function(UserCourseModel) then) =
      _$UserCourseModelCopyWithImpl<$Res, UserCourseModel>;
  @useResult
  $Res call(
      {String name,
      double credit,
      String type,
      int? design,
      String semester,
      String gradeOrPf,
      bool isEnglish,
      String? category});
}

/// @nodoc
class _$UserCourseModelCopyWithImpl<$Res, $Val extends UserCourseModel>
    implements $UserCourseModelCopyWith<$Res> {
  _$UserCourseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? credit = null,
    Object? type = null,
    Object? design = freezed,
    Object? semester = null,
    Object? gradeOrPf = null,
    Object? isEnglish = null,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      credit: null == credit
          ? _value.credit
          : credit // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      design: freezed == design
          ? _value.design
          : design // ignore: cast_nullable_to_non_nullable
              as int?,
      semester: null == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as String,
      gradeOrPf: null == gradeOrPf
          ? _value.gradeOrPf
          : gradeOrPf // ignore: cast_nullable_to_non_nullable
              as String,
      isEnglish: null == isEnglish
          ? _value.isEnglish
          : isEnglish // ignore: cast_nullable_to_non_nullable
              as bool,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserCourseModelCopyWith<$Res>
    implements $UserCourseModelCopyWith<$Res> {
  factory _$$_UserCourseModelCopyWith(
          _$_UserCourseModel value, $Res Function(_$_UserCourseModel) then) =
      __$$_UserCourseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      double credit,
      String type,
      int? design,
      String semester,
      String gradeOrPf,
      bool isEnglish,
      String? category});
}

/// @nodoc
class __$$_UserCourseModelCopyWithImpl<$Res>
    extends _$UserCourseModelCopyWithImpl<$Res, _$_UserCourseModel>
    implements _$$_UserCourseModelCopyWith<$Res> {
  __$$_UserCourseModelCopyWithImpl(
      _$_UserCourseModel _value, $Res Function(_$_UserCourseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? credit = null,
    Object? type = null,
    Object? design = freezed,
    Object? semester = null,
    Object? gradeOrPf = null,
    Object? isEnglish = null,
    Object? category = freezed,
  }) {
    return _then(_$_UserCourseModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      credit: null == credit
          ? _value.credit
          : credit // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      design: freezed == design
          ? _value.design
          : design // ignore: cast_nullable_to_non_nullable
              as int?,
      semester: null == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as String,
      gradeOrPf: null == gradeOrPf
          ? _value.gradeOrPf
          : gradeOrPf // ignore: cast_nullable_to_non_nullable
              as String,
      isEnglish: null == isEnglish
          ? _value.isEnglish
          : isEnglish // ignore: cast_nullable_to_non_nullable
              as bool,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserCourseModel implements _UserCourseModel {
  _$_UserCourseModel(
      {required this.name,
      required this.credit,
      required this.type,
      this.design,
      required this.semester,
      required this.gradeOrPf,
      required this.isEnglish,
      this.category});

  factory _$_UserCourseModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserCourseModelFromJson(json);

  @override
  final String name;
  @override
  final double credit;
  @override
  final String type;
  @override
  final int? design;
  @override
  final String semester;
  @override
  final String gradeOrPf;
  @override
  final bool isEnglish;
  @override
  final String? category;

  @override
  String toString() {
    return 'UserCourseModel(name: $name, credit: $credit, type: $type, design: $design, semester: $semester, gradeOrPf: $gradeOrPf, isEnglish: $isEnglish, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserCourseModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.credit, credit) || other.credit == credit) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.design, design) || other.design == design) &&
            (identical(other.semester, semester) ||
                other.semester == semester) &&
            (identical(other.gradeOrPf, gradeOrPf) ||
                other.gradeOrPf == gradeOrPf) &&
            (identical(other.isEnglish, isEnglish) ||
                other.isEnglish == isEnglish) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, credit, type, design,
      semester, gradeOrPf, isEnglish, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCourseModelCopyWith<_$_UserCourseModel> get copyWith =>
      __$$_UserCourseModelCopyWithImpl<_$_UserCourseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserCourseModelToJson(
      this,
    );
  }
}

abstract class _UserCourseModel implements UserCourseModel {
  factory _UserCourseModel(
      {required final String name,
      required final double credit,
      required final String type,
      final int? design,
      required final String semester,
      required final String gradeOrPf,
      required final bool isEnglish,
      final String? category}) = _$_UserCourseModel;

  factory _UserCourseModel.fromJson(Map<String, dynamic> json) =
      _$_UserCourseModel.fromJson;

  @override
  String get name;
  @override
  double get credit;
  @override
  String get type;
  @override
  int? get design;
  @override
  String get semester;
  @override
  String get gradeOrPf;
  @override
  bool get isEnglish;
  @override
  String? get category;
  @override
  @JsonKey(ignore: true)
  _$$_UserCourseModelCopyWith<_$_UserCourseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
