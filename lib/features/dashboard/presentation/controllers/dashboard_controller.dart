import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:tranquil_admin_portal/core/constants/app_strings.dart';
import 'package:tranquil_admin_portal/core/global/custom_snackbar.dart';
import 'package:tranquil_admin_portal/features/dashboard/data/models/topic_model.dart';
import 'package:tranquil_admin_portal/features/dashboard/data/repos/dashboard_repo.dart';
import 'package:tranquil_admin_portal/features/dashboard/domain/entities/mood_data.dart';
import 'package:tranquil_admin_portal/features/therapists/presentation/controllers/therapists_controller.dart';

class DashboardController extends GetxController {
  static DashboardController instance = Get.find();

  DashboardRepoImpl dashboardRepo = DashboardRepoImpl();

  var sessionStatus = AppStrings.completed.obs;
  var totalEntries = 0.obs;

  Future<int> countSessions() async {
    int total = 0;

    if (sessionStatus.value == AppStrings.completed) {
      total = await countCompletedSessions();
    } else if (sessionStatus.value == AppStrings.pending) {
      total = await countPendingSessions();
    } else if (sessionStatus.value == AppStrings.inProgress) {
      total = await countSessionsInProgress();
    } else {
      total = await countCancelledSessions();
    }

    return total;
  }

  //Get number of completed sessions
  Future<int> countCompletedSessions({int lastQuarter = 1}) async {
    int total = 0;

    Either either = await dashboardRepo.countSessions(lastQuarter: lastQuarter);
    either.fold(
        (l) => CustomSnackBar.errorSnackBar("Completed sessions: ${l.message}"),
        (r) {
      total = r['data'];
    });

    return total;
  }

  //Get number of pending sessions
  Future<int> countPendingSessions({int lastQuarter = 1}) async {
    int total = 0;

    Either either = await dashboardRepo.countSessions(
        lastQuarter: lastQuarter, status: AppStrings.pending);
    either.fold(
        (l) => CustomSnackBar.errorSnackBar("Pending sessions: ${l.message}"),
        (r) {
      total = r['data'];
    });

    return total;
  }

  //Get number of sessions in progress
  Future<int> countSessionsInProgress({int lastQuarter = 1}) async {
    int total = 0;

    Either either = await dashboardRepo.countSessions(
        lastQuarter: lastQuarter, status: AppStrings.inProgress);
    either.fold(
        (l) =>
            CustomSnackBar.errorSnackBar("Sessions In Progress: ${l.message}"),
        (r) {
      total = r['data'];
    });

    return total;
  }

  //Get number of cancelled sessions
  Future<int> countCancelledSessions({int lastQuarter = 1}) async {
    int total = 0;

    Either either = await dashboardRepo.countSessions(
        lastQuarter: lastQuarter, status: AppStrings.cancelled);
    either.fold(
        (l) => CustomSnackBar.errorSnackBar("Cancelled sessions: ${l.message}"),
        (r) {
      total = r['data'];
    });

    return total;
  }

  //Get number of therapists
  Future<int> countActiveAccounts() async {
    int total = 0;

    Either either = await dashboardRepo.countActiveAccounts();
    either.fold(
        (l) => CustomSnackBar.errorSnackBar("Active accounts: ${l.message}"),
        (r) {
      total = r['data'];
    });

    return total;
  }

  //Get number of therapists
  Future<int> countTherapists() async {
    TherapistsController therapistsController = TherapistsController();
    var total = await therapistsController.countAllTherapists();
    return total;
  }

  //Get number of businesses
  Future<int> countBusinesses() async {
    int total = 0;

    Either either = await dashboardRepo.countBusinesses();
    either.fold((l) => CustomSnackBar.errorSnackBar("Businesses: ${l.message}"),
        (r) {
      total = r['data'];
    });

    return total;
  }

  //Get number of registered users (includes admin, clients and therapists)
  Future<int> countRegisteredUsers({int lastQuarter = 1}) async {
    int total = 0;

    Either either =
        await dashboardRepo.countRegisteredUsers(lastQuarter: lastQuarter);
    either.fold(
        (l) => CustomSnackBar.errorSnackBar("Registered users: ${l.message}"),
        (r) {
      total = r['data'];
    });

    return total;
  }

  Future<List<TopicModel>> topTopicsWithMira() async {
    List<TopicModel> topics = <TopicModel>[];

    Either either = await dashboardRepo.getTopTopicsWithMira();
    either.fold(
        (l) =>
            CustomSnackBar.errorSnackBar("Top topics with Mira: ${l.message}"),
        (r) {
      var data = r['data'] as List;

      if (data.isNotEmpty) {
        topics = data.map((e) => TopicModel.fromJson(e)).toList();
      }
    });

    return topics;
  }

  Future<Map<String, dynamic>> convertToMoodData() async {
    List<MoodData> moods = <MoodData>[];
    Map<String, dynamic> moodsTracked = {};
    Either either = await dashboardRepo.getMoodTrackingStats();
    either.fold(
        (l) => CustomSnackBar.errorSnackBar("Mood tracking data: ${l.message}"),
        (r) {
      var data = r['data'];
      if (data != null) {
        var moodUsage = data['mood_usage'];
        if (moodUsage is! List) {
          moods = moodUsage.entries.map<MoodData>((entry) {
            return MoodData(
              entry.key
                  .toString()
                  .capitalizeFirst!, // Capitalize mood name for display
              entry.value, // Total count
            );
          }).toList();
        }

        moodsTracked.addAll(
            {'mood_usage': moods, 'number_of_users': data['number_of_users']});
      }
    });

    return moodsTracked;
  }

  Future<int> countJournalEntries() async {
    int total = 0;

    Either either = await dashboardRepo.countJournalEntries();

    either.fold((l) => CustomSnackBar.errorSnackBar("Entries: ${l.message}"),
        (r) {
      total = r['data'];
      totalEntries.value = total;
    });

    return total;
  }

  Future<int> countSharedEntries() async {
    int total = 0;

    Either either = await dashboardRepo.countSharedEntries();

    either.fold(
        (l) => CustomSnackBar.errorSnackBar("Shared Entries: ${l.message}"),
        (r) {
      total = r['data'];
    });

    return total;
  }
}
