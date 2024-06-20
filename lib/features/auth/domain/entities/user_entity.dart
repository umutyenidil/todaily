import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String fullName;
  final String emailAddress;

  const UserEntity({
    required this.id,
    required this.fullName,
    required this.emailAddress,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
