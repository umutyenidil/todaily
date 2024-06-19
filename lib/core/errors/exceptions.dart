import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  final String message;
  final String code;

  const ServerException({
    this.message = 'Something went wrong on the server',
    this.code = '-1',
  });

  @override
  List<Object?> get props => [
        message,
        code,
      ];
}

class CacheException extends Equatable implements Exception {
  final String message;

  const CacheException({
    this.message = 'Something went wrong on the device',
  });

  @override
  List<Object?> get props => [
        message,
      ];
}
