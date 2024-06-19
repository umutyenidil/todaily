import '../utils/typedefs.dart';

abstract interface class UseCase<Type, Params>{
  ResultFuture<Type> call(Params params);
}