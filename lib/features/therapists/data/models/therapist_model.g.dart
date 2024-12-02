part of 'therapist_model.dart';

TherapistModel _$TherapistFromJson(Map<String, dynamic> json) => TherapistModel(
    id: json['id'],
    fName: json['f_name'],
    lName: json['l_name'] ?? "",
    gender: json['gender'] ?? "",
    phone: json['phone'],
    email: json['email'],
    birthDate: json['birth_date'],
    emailVerifiedAt: json['email_verified_at'] != null
        ? DateTime.parse(json['email_verified_at'])
        : null,
    blockedAt:
        json['blocked_at'] != null ? DateTime.parse(json['blocked_at']) : null,
    avatarUrl: json['avatar_url'],
    audioIntro: json['audio_intro'],
    videoIntro: json['video_intro'],
    earnings: json['earnings'] != null
        ? EarningsModel.fromJson(
            json['earnings']) // Ensure proper deserialization
        : null,

    // videoIntro: json['video_intro'],

    // linkedinUrl: json['linkedin_url'],
    // identityUrl: json['identity_url'],
    // employmentStatus: json['employment_status'],
    // company: json['company'],
    // companyAddress: json['company_address'],
    // approved: json['approved'] == 0 ? false : true,
    // languages: List<String>.from(json['languages'] ?? []),
    // years: json['years'],
    // rating: (json['rating'] as num?)?.toDouble(),
    // specialties: json['specialties'] != null
    //     ? List<String>.from(json['specialties'])
    //     : null,
    // availableTime: json['available_time'] != null
    //     ? List<String>.from(json['available_time'])
    //     : null,
    // fee: json['fee'] ?? 0,
    // bio: json['bio'],
    // cvUrl: json['cv_url'],
    // staffId: json['staff_id'],
    // latitude: 0.00,
    // // latitude: json['latitude'],
    // longitude: 0.00,
    // //json['longitude']
    // timeZone: json['time_zone'],
    // location: json['location'],
    // timezoneIdentifier: json['timezone_identifier'],
    // onlineStatus: json['online_status'],
    // authToken: json['auth_token'],
    // fcmToken: json['fcm_token'],
    // therapistType: json['therapist_type'],
    // aiPrompt: json['ai_prompt'],
    // currency: json['currency'],
    // lastSeen: json['last_seen'],
    // bvn: json['bvn'],
    createdAt:
        json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
    updatedAt:
        json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    completedSessions: json['completed_sessions'] ?? 0);
