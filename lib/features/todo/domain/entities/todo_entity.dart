import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  final String id;
  final String title;
  final String description;

  const TodoEntity({
    required this.id,
    required this.title,
    required this.description,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
      ];
}
