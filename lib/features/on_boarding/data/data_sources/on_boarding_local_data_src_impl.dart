import 'package:shared_preferences/shared_preferences.dart';
import 'package:todaily/core/errors/exceptions.dart';
import 'package:todaily/core/utils/constants.dart';
import 'package:todaily/features/on_boarding/data/data_sources/on_boarding_local_data_src.dart';

class OnBoardingLocalDataSrcImpl implements OnBoardingLocalDataSrc {
  final SharedPreferences sharedPreferences;

  OnBoardingLocalDataSrcImpl({
    required this.sharedPreferences,
  });

  @override
  Future<void> cacheFirstTime() async {
    try {
      await sharedPreferences.setBool(kFirstTime, false);
    } catch (_) {
      throw const CacheException();
    }
  }

  @override
  Future<bool> isFirstTime() async {
    try {
      return sharedPreferences.getBool(kFirstTime) ?? true;
    } catch (_) {
      throw const CacheException();
    }
  }
}
