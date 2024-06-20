import 'dart:convert';

import 'package:todaily/core/utils/constants.dart';
import 'package:todaily/core/utils/typedefs.dart';
import 'package:todaily/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.fullName,
    required super.emailAddress,
  });

  factory UserModel.fromMap(ResultMap map) {
    return UserModel(
      id: map[kId] as String,
      fullName: map[kFullName] as String,
      emailAddress: map[kEmailAddress] as String,
    );
  }

  factory UserModel.fromJson(String json) {
    return UserModel.fromMap(jsonDecode(json));
  }

  UserModel copyWith({
    String? emailAddress,
    String? fullName,
  }) {
    return UserModel(
      id: id,
      fullName: fullName ?? this.fullName,
      emailAddress: emailAddress ?? this.emailAddress,
    );
  }

  ResultMap toMap() {
    return {
      kId: id,
      kFullName: fullName,
      kEmailAddress: emailAddress,
    };
  }

  String toJson() {
    return jsonEncode(toMap());
  }


}
