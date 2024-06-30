import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todaily/core/utils/constants.dart';
import 'package:todaily/core/utils/typedefs.dart';
import 'package:todaily/features/profile/domain/entities/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  const ProfileModel({
    required super.id,
    required super.fullName,
  });

  ProfileModel.fromDocumentSnapshot(DocumentSnapshot snapshot)
      : super(
          id: snapshot.id,
          fullName: (snapshot.data() as ResultMap)[kFullName],
        );
}
