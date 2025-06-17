import 'package:tranquil_admin_portal/core/domain/query_params.dart';
import 'package:tranquil_admin_portal/features/therapists/domain/entities/earnings.dart';

part 'therapist.g.dart';

abstract class Therapist extends QueryParams {
  final int? id;
  final String? fName;
  final String? lName;
  final String? gender;
  final String? phone;
  final String? email;
  final String? birthDate;
  final List? specialties;
  final String? avatarUrl;
  final String? audioIntro;
  final String? videoIntro;
  final DateTime? emailVerifiedAt;
  final DateTime? blockedAt;

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
  final int? completedSessions;

  Therapist(
      {this.id,
      this.fName,
      this.lName,
      this.gender,
      this.phone,
      this.email,
      this.birthDate,
      this.emailVerifiedAt,
      this.blockedAt,
      this.avatarUrl,
      this.audioIntro,
      this.videoIntro,
      this.earnings,
      this.completedSessions,
      this.specialties,

      //  this.videoIntro,
      //  this.linkedinUrl,
      //  this.identityUrl,
      //  this.employmentStatus,
      //  this.company,
      //  this.companyAddress,
      //  this.approved,
      //  this.languages,
      //  this.years,
      //  this.rating,
      //  this.specialties,
      //  this.availableTime,
      //  this.fee,
      // //  this.bio,
      //  this.cvUrl,
      //  this.staffId,
      // //  this.latitude,
      // //  this.longitude,
      // //  this.timeZone,
      //  this.location,
      // //  this.timezoneIdentifier,
      // //  this.onlineStatus,
      // //  this.authToken,
      // //  this.fcmToken,
      // //  this.aiPrompt,
      //  this.currency,
      //  this.lastSeen,
      //  this.bvn,
      this.createdAt,
      this.updatedAt});

  @override
  Map<String, dynamic> toJson() => _$TherapistToJson(this);
}
