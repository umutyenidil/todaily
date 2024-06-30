import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String id;
  final String fullName;

  const ProfileEntity({
    required this.id,
    required this.fullName,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
