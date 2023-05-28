import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezedModel/userModel.freezed.dart';
part 'freezedModel/userModel.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    required String email,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
