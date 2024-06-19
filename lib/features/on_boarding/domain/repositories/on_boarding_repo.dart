import 'package:todaily/core/utils/typedefs.dart';

abstract interface class OnBoardingRepo {
  ResultFuture<void> cacheFirstTime();

  ResultFuture<bool> isFirstTime();
}
