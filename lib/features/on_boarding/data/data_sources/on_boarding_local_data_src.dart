abstract interface class OnBoardingLocalDataSrc {
  Future<void> cacheFirstTime();

  Future<bool> isFirstTime();
}
