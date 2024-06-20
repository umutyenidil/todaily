import 'package:equatable/equatable.dart';
import 'exceptions.dart';

abstract class Failure extends Equatable {
  final String message;
  final String code;

  Failure({
    required this.message,
    this.code = '-1',
  }) : assert(
          code.runtimeType == String,
          'Code cannot be type of ${code.runtimeType}',
        );

  @override
  List<Object> get props => [
        message,
        code,
      ];
}

class CacheFailure extends Failure {
  CacheFailure({
    super.message = 'Something went wrong on the device',
  }) : super(
          code: '-1',
        );

  CacheFailure.fromException(CacheException exception)
      : super(
          message: exception.message,
        );
}

class ServerFailure extends Failure {
  ServerFailure({
    super.message = 'Something went wrong on the server',
    super.code = '400',
  });

  ServerFailure.fromException(ServerException exception)
      : super(
          message: exception.message,
          code: exception.code,
        );
}
