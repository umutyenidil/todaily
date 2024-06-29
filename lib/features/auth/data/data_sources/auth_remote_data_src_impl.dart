import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todaily/core/errors/exceptions.dart';
import 'package:todaily/core/utils/constants.dart';
import 'package:todaily/features/auth/data/data_sources/auth_remote_data_src.dart';
import 'package:todaily/features/auth/data/models/user_model.dart';

class AuthRemoteDataSrcImpl implements AuthRemoteDataSrc {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  const AuthRemoteDataSrcImpl({
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });

  @override
  Future<UserModel> signUp({
    required String fullName,
    required String emailAddress,
    required String password,
  }) async {
    try {
      final credentials = await firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      if (credentials.user == null) {
        throw const ServerException(message: 'User is not created');
      }

      final doc = firebaseFirestore.collection(kUsers).doc(credentials.user!.uid);

      await doc.set({
        kFullName: fullName,
      });

      return UserModel(
        id: credentials.user!.uid,
        fullName: fullName,
        emailAddress: credentials.user!.email!,
      );
    } on ServerException {
      rethrow;
    } on FirebaseAuthException catch (e) {
      throw ServerException(message: e.message ?? "Something went wrong");
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
