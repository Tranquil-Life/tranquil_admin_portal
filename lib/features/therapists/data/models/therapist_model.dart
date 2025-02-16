import 'package:tranquil_admin_portal/features/therapists/data/models/earnings_model.dart';
import 'package:tranquil_admin_portal/features/therapists/domain/entities/earnings.dart';
import 'package:tranquil_admin_portal/features/therapists/domain/entities/therapist.dart';

part 'therapist_model.g.dart';

class TherapistModel extends Therapist {
  TherapistModel(
      {
           super.id,
       super.fName,
       super.lName,
       super.gender,
       super.phone,
       super.email,
       super.birthDate,
       super.emailVerifiedAt,
       super.blockedAt,
       super.avatarUrl,
       super.audioIntro,
          super.videoIntro,
      //  super.linkedinUrl,
      //  super.identityUrl,
      //  super.employmentStatus,
      //  super.company,
      //  super.companyAddress,
      //  super.approved,
      //  super.languages,
      //  super.years,
      //  super.rating,
      // super.specialties,
      //  super.availableTime,
      //  super.fee,
      //  super.bio,
      //  super.cvUrl,
      //  super.staffId,
      //  super.latitude,
      //  super.longitude,
      //  super.timeZone,
      //  super.location,
      //  super.timezoneIdentifier,
      //  super.onlineStatus,
      //  super.authToken,
      //  super.fcmToken,
      //  super.therapistType,
      //  super.aiPrompt,
      //  super.currency,
      //  super.lastSeen,
      //  super.bvn,
       super.createdAt,
       super.updatedAt,
      super.earnings,
       super.completedSessions});

  factory TherapistModel.fromJson(Map<String, dynamic> json) =>
      _$TherapistFromJson(json);
}
