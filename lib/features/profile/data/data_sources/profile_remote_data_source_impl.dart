import 'dart:developer' as dev;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todaily/core/errors/exceptions.dart';
import 'package:todaily/core/utils/constants.dart';
import 'package:todaily/core/utils/typedefs.dart';
import 'package:todaily/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:todaily/features/profile/data/models/profile_model.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  const ProfileRemoteDataSourceImpl({
    required FirebaseFirestore firebaseFirestore,
    required FirebaseAuth firebaseAuth,
  })  : _firebaseFirestore = firebaseFirestore,
        _firebaseAuth = firebaseAuth;

  @override
  Future<ProfileModel> getCurrentUserProfile() async {
    try {
      final user = _firebaseAuth.currentUser;

      if (user == null) {
        throw const ServerException(message: "User not signed in");
      }

      final query = _firebaseFirestore.collection(kProfiles);
      final docRef = query.doc(user.uid);

      final docSnapshot = await docRef.get();

      return ProfileModel.fromDocumentSnapshot(docSnapshot);
    } on ServerException {
      rethrow;
    } catch (e) {
      dev.log(e.toString());
      throw const ServerException();
    }
  }

  @override
  Future<ProfileModel> updateProfile({
    String? fullName,
  }) async {
    try {
      final user = _firebaseAuth.currentUser;

      if (user == null) {
        throw const ServerException(message: "User not signed in");
      }

      final query = _firebaseFirestore.collection(kProfiles);

      final docRef = query.doc(user.uid);

      final snapshot = await docRef.get();

      final profile = ProfileModel.fromDocumentSnapshot(snapshot);

      final ResultMap data = {};

      if (fullName != null && fullName != profile.fullName) {
        data[kFullName] = fullName;
      }

      if (data.isNotEmpty) {
        await docRef.update(data);

        final snapshot = await docRef.get();

        final profile = ProfileModel.fromDocumentSnapshot(snapshot);

        return profile;
      } else {
        return profile;
      }
    } catch (e) {
      dev.log(e.toString());
      throw const ServerException();
    }
  }
}
