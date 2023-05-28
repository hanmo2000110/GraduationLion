// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gcourseModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GCourseModel _$GCourseModelFromJson(Map<String, dynamic> json) {
  return _GCourseModel.fromJson(json);
}

/// @nodoc
mixin _$GCourseModel {
  String get name => throw _privateConstructorUsedError;
  double get credit => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get detail => throw _privateConstructorUsedError;
  String get gradeOrPf => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GCourseModelCopyWith<GCourseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GCourseModelCopyWith<$Res> {
  factory $GCourseModelCopyWith(
          GCourseModel value, $Res Function(GCourseModel) then) =
      _$GCourseModelCopyWithImpl<$Res, GCourseModel>;
  @useResult
  $Res call(
      {String name,
      double credit,
      String type,
      String detail,
      String gradeOrPf,
      String category});
}

/// @nodoc
class _$GCourseModelCopyWithImpl<$Res, $Val extends GCourseModel>
    implements $GCourseModelCopyWith<$Res> {
  _$GCourseModelCopyWithImpl(this._value, this._then);

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
    Object? detail = null,
    Object? gradeOrPf = null,
    Object? category = null,
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
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      gradeOrPf: null == gradeOrPf
          ? _value.gradeOrPf
          : gradeOrPf // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GCourseModelCopyWith<$Res>
    implements $GCourseModelCopyWith<$Res> {
  factory _$$_GCourseModelCopyWith(
          _$_GCourseModel value, $Res Function(_$_GCourseModel) then) =
      __$$_GCourseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      double credit,
      String type,
      String detail,
      String gradeOrPf,
      String category});
}

/// @nodoc
class __$$_GCourseModelCopyWithImpl<$Res>
    extends _$GCourseModelCopyWithImpl<$Res, _$_GCourseModel>
    implements _$$_GCourseModelCopyWith<$Res> {
  __$$_GCourseModelCopyWithImpl(
      _$_GCourseModel _value, $Res Function(_$_GCourseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? credit = null,
    Object? type = null,
    Object? detail = null,
    Object? gradeOrPf = null,
    Object? category = null,
  }) {
    return _then(_$_GCourseModel(
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
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      gradeOrPf: null == gradeOrPf
          ? _value.gradeOrPf
          : gradeOrPf // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GCourseModel implements _GCourseModel {
  _$_GCourseModel(
      {required this.name,
      required this.credit,
      required this.type,
      required this.detail,
      required this.gradeOrPf,
      required this.category});

  factory _$_GCourseModel.fromJson(Map<String, dynamic> json) =>
      _$$_GCourseModelFromJson(json);

  @override
  final String name;
  @override
  final double credit;
  @override
  final String type;
  @override
  final String detail;
  @override
  final String gradeOrPf;
  @override
  final String category;

  @override
  String toString() {
    return 'GCourseModel(name: $name, credit: $credit, type: $type, detail: $detail, gradeOrPf: $gradeOrPf, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GCourseModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.credit, credit) || other.credit == credit) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.gradeOrPf, gradeOrPf) ||
                other.gradeOrPf == gradeOrPf) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, credit, type, detail, gradeOrPf, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GCourseModelCopyWith<_$_GCourseModel> get copyWith =>
      __$$_GCourseModelCopyWithImpl<_$_GCourseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GCourseModelToJson(
      this,
    );
  }
}

abstract class _GCourseModel implements GCourseModel {
  factory _GCourseModel(
      {required final String name,
      required final double credit,
      required final String type,
      required final String detail,
      required final String gradeOrPf,
      required final String category}) = _$_GCourseModel;

  factory _GCourseModel.fromJson(Map<String, dynamic> json) =
      _$_GCourseModel.fromJson;

  @override
  String get name;
  @override
  double get credit;
  @override
  String get type;
  @override
  String get detail;
  @override
  String get gradeOrPf;
  @override
  String get category;
  @override
  @JsonKey(ignore: true)
  _$$_GCourseModelCopyWith<_$_GCourseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
