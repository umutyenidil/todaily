import 'package:flutter/foundation.dart';
import 'package:todaily/features/profile/domain/entities/profile_entity.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileEntity? _profile;

  ProfileEntity? get profile => _profile;

  void setProfile(ProfileEntity profile) {
    _profile = profile;
    notifyListeners();
  }
}
