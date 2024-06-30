import 'dart:convert';

import 'package:todaily/core/utils/constants.dart';
import 'package:todaily/core/utils/typedefs.dart';
import 'package:todaily/features/auth/domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    required super.id,
    required super.email,
  });

  factory AuthModel.fromMap(ResultMap map) {
    return AuthModel(
      id: map[kId] as String,
      email: map[kEmailAddress] as String,
    );
  }

  factory AuthModel.fromJson(String json) {
    return AuthModel.fromMap(jsonDecode(json));
  }

  AuthModel copyWith({
    String? email,
    String? fullName,
  }) {
    return AuthModel(
      id: id,
      email: email ?? this.email,
    );
  }

  ResultMap toMap() {
    return {
      kId: id,
      kEmailAddress: email,
    };
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}
