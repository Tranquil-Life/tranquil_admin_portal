import 'package:tranquil_admin_portal/features/therapists/data/models/earnings_model.dart';
import 'package:tranquil_admin_portal/features/therapists/domain/entities/earnings.dart';
import 'package:tranquil_admin_portal/features/therapists/domain/entities/therapist.dart';

part 'therapist_model.g.dart';

class TherapistModel extends Therapist {
  TherapistModel(
      {required super.id,
      required super.fName,
      required super.lName,
      required super.gender,
      required super.phone,
      required super.email,
      required super.birthDate,
      required super.emailVerifiedAt,
      required super.blockedAt,
      required super.avatarUrl,
      required super.audioIntro,
          super.videoIntro,
      // required super.linkedinUrl,
      // required super.identityUrl,
      // required super.employmentStatus,
      // required super.company,
      // required super.companyAddress,
      // required super.approved,
      // required super.languages,
      // required super.years,
      // required super.rating,
      // super.specialties,
      // required super.availableTime,
      // required super.fee,
      // required super.bio,
      // required super.cvUrl,
      // required super.staffId,
      // required super.latitude,
      // required super.longitude,
      // required super.timeZone,
      // required super.location,
      // required super.timezoneIdentifier,
      // required super.onlineStatus,
      // required super.authToken,
      // required super.fcmToken,
      // required super.therapistType,
      // required super.aiPrompt,
      // required super.currency,
      // required super.lastSeen,
      // required super.bvn,
      required super.createdAt,
      required super.updatedAt,
      super.earnings,
      required super.completedSessions});

  factory TherapistModel.fromJson(Map<String, dynamic> json) =>
      _$TherapistFromJson(json);
}
