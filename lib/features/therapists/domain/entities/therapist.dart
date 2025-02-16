import 'package:tranquil_admin_portal/core/domain/query_params.dart';
import 'package:tranquil_admin_portal/features/therapists/domain/entities/earnings.dart';

part 'therapist.g.dart';

abstract class Therapist extends QueryParams {
  final int id;
  final String fName;
  final String lName;
  final String gender;
  final String phone;
  final String email;
  final String birthDate;
  final DateTime? emailVerifiedAt;
  final DateTime? blockedAt;
  final String? avatarUrl;
  final String? audioIntro;
  final String? videoIntro;

  // final String? linkedinUrl;
  // final String? identityUrl;
  // final String? employmentStatus;
  // final String? company;
  // final String? companyAddress;
  // final bool approved;
  // final List<String> languages;
  // final String? years;
  // final double? rating;
  // final List<String>? specialties;
  // final List<String>? availableTime;
  // final int fee;
  // final String? bio;
  // final String? cvUrl;
  // final String? staffId;
  // final double? latitude;
  // final double? longitude;
  // final String? timeZone;
  // final String? location;
  // final String? timezoneIdentifier;
  // final String? onlineStatus;
  // final String? authToken;
  // final String? fcmToken;
  // final String therapistType;
  // final String? aiPrompt;
  // final String? currency;
  // final String? lastSeen;
  // final String? bvn;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  final Earnings? earnings;
  final int completedSessions;

  Therapist({
    required this.id,
    required this.fName,
    required this.lName,
    required this.gender,
    required this.phone,
    required this.email,
    required this.birthDate,
    required this.emailVerifiedAt,
    required this.blockedAt,
    required this.avatarUrl,
    required this.audioIntro,
    this.videoIntro,
    this.earnings,
    required this.completedSessions,

    // required this.videoIntro,
    // required this.linkedinUrl,
    // required this.identityUrl,
    // required this.employmentStatus,
    // required this.company,
    // required this.companyAddress,
    // required this.approved,
    // required this.languages,
    // required this.years,
    // required this.rating,
    // required this.specialties,
    // required this.availableTime,
    // required this.fee,
    // // required this.bio,
    // required this.cvUrl,
    // required this.staffId,
    // // required this.latitude,
    // // required this.longitude,
    // // required this.timeZone,
    // required this.location,
    // // required this.timezoneIdentifier,
    // // required this.onlineStatus,
    // // required this.authToken,
    // // required this.fcmToken,
    // // required this.aiPrompt,
    // required this.currency,
    // required this.lastSeen,
    // required this.bvn,
    required this.createdAt,
    required this.updatedAt
  });

  @override
  Map<String, dynamic> toJson() => _$TherapistToJson(this);
}
